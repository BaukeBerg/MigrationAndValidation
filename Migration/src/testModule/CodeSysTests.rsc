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

public Variables allSymbols = convertSymbols(loadSymbols("DR_TOT_3"));

symbol faultyName = <"S_0,1SEC","511.0","!triggerpuls 0,1 sec.">;
str expectedResult = "\tS_0_1SEC : BOOL ; (* 511.0 !triggerpuls 0,1 sec. *)";

test bool testInvalidChars() = expectEqual(expectedResult, extractVariable(faultyName), "Invalid chars are replaced by underscores");

str constantString = "++Lime++CodeBlock: 00024-00038 is AssignConstant 00000 to 00320,00321,00322,00323,00324,00325,00326,00327,00328,00329,00330,00331,00332,00333";
public AssignConstant constant = parse(#AssignConstant, constantString);

list[str] expectedStatements = ["(* <constantString> *)",
                                "00320 := 0 ;",
                                "00321 := 0 ;", 
                                "00322 := 0 ;",
                                "00323 := 0 ;",
                                "00324 := 0 ;",
                                "00325 := 0 ;",
                                "00326 := 0 ;",
                                "00327 := 0 ;",
                                "00328 := 0 ;",
                                "00329 := 0 ;",
                                "00330 := 0 ;",
                                "00331 := 0 ;",
                                "00332 := 0 ;",
                                "00333 := 0 ;"];

test bool testAssignConversion() = expectEqual(expectedStatements, extractStatements(constant), "generating a block is the commented value followed by the statements");

test bool allSymbolDeclarations()
{
  generateProgram("AllSymbols.EXP", <allSymbols, extractStatements(constant)>);
  return true;
} 
