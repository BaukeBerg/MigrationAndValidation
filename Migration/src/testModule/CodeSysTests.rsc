module testModule::CodeSysTests

import CodeSysGenerator;
import ParseTree;
import PC20Syntax;
import SymbolTable;
import String;

import utility::FileUtility;
import utility::TestUtility;

list[str] emptyProgram = ["PROGRAM PLC_PRG", "VAR", "END_VAR", "END_PROGRAM"];

PlcProgram emptyModel = <[], []>;

test bool testGeneratingEmptyProgram() = expectEqual(emptyProgram, generateOutput(emptyModel));

str sampleBool = "\ttheBool : BOOL ; (* 0.1 !IAmBool *)";
symbol boolean = <"theBool", "0.1", "!IAmBool">;

str sampleInt = "\tnumeric : INT ; (* 100 !Numeric *)";
symbol integer = <"numeric", "100", "!Numeric">;

test bool testBooleanVariable() = expectEqual(sampleBool, extractVariable(boolean), "boolean types are distinguished based on the .");
test bool testIntegerVariable() = expectEqual(sampleInt, extractVariable(integer), "int values are converted based on the missing int");

symbol faultyName = <"S_0,1SEC","511.0","!triggerpuls 0,1 sec.">;
str expectedResult = "\tS_0_1SEC : BOOL ; (* 511.0 !triggerpuls 0,1 sec. *)";

test bool testInvalidChars() = expectEqual(expectedResult, extractVariable(faultyName), "Invalid chars are replaced by underscores");

str constantString = "++Lime++CodeBlock: 00024-00038 is AssignConstant 00000 to 00320,00321,00322,00323,00324,00325,00326,00327,00328,00329,00330,00331,00332,00333";
public AssignConstant constant = parse(#AssignConstant, constantString);

list[str] expectedStatements = ["(* <constantString> *)",
                                "320 := 0 ;",
                                "321 := 0 ;", 
                                "322 := 0 ;",
                                "323 := 0 ;",
                                "324 := 0 ;",
                                "325 := 0 ;",
                                "326 := 0 ;",
                                "327 := 0 ;",
                                "328 := 0 ;",
                                "329 := 0 ;",
                                "330 := 0 ;",
                                "331 := 0 ;",
                                "332 := 0 ;",
                                "333 := 0 ;"];

test bool testAssignConversion() = expectEqual(expectedStatements, extractStatements(constant, symbols), "generating a block is the commented value followed by the statements");

public symbolTable symbols = loadSymbols("DR_TOT_3");

list[str] expectedResetBitStatements = ["ALARM01 := false ; (* !spoeldruk te hoog *)",
                                    "ALARM02 := false ; (* !stuurlucht gestoord *)",
                                    "ALARM03 := false ; (* !stuurspanning gestoord *)",
                                    "ALARM04 := false ; (* !vuilwatertank bijna leeg *)"];
                                    
list[str] expectedResetValidStatements = ["ALARM05 := true ; (* !vuilwatertank leeg *)",
                                    "ALARM05 := false ; (* !geleidbaarheid na spoelen *)",
                                    "ALARM05 := true ; (* !filtercapaciteit te laag *)",
                                    "ALARM05 := false ; (* !concentraat afvoer gestoord *)"];
                                         
test bool testBitConversionWithZero() = expectEqual(expectedResetBitStatements, evaluateAssign(symbols, "00320", 0), "resetting bits word-wise must expand to bitwyse addressing");
test bool testBitConversionWithValue() = expectEqual(expectedResetValidStatements, evaluateAssign(symbols, "00321", 5), "setting this value should set bit .1 and bit .3");

test bool allSymbolDeclarations()
{
  generateProgram("AllSymbols.EXP", <convertSymbols(symbols), extractStatements(constant, symbols)>);
  return true;
} 
