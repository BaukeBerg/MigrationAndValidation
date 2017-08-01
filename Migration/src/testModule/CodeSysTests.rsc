module testModule::CodeSysTests

import CodeSysGenerator;

import utility::TestUtility;

list[str] emptyProgram = ["PROGRAM PLC_PRG", "VAR", "END_VAR", "END_PROGRAM"];

PlcProgram emptyModel = <[], []>;

test bool testGeneratingEmptyProgram() = expectEqual(emptyProgram, generateOutput(emptyModel)); 
