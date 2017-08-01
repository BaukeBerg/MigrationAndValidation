module testModule::CodeSysTests

import CodeSysGenerator;
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


test bool allSymbolDeclarations()
{
  generateProgram("AllSymbols.EXP", <allSymbols,[]>);
  return true;
} 

symbol faultyName = <"S_0,1SEC","511.0","!triggerpuls 0,1 sec.">;
str expectedResult = "\tS_0_1SEC : BOOL ; (* 511.0 !triggerpuls 0,1 sec. *)";

test bool testInvalidChars() = expectEqual(expectedResult, extractVariable(faultyName), "Invalid chars are replaced by underscores");
