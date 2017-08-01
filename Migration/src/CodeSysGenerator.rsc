module CodeSysGenerator

import FileLocations;
import List;
import ParseTree;
import PC20Syntax;

import utility::FileUtility;

alias PlcProgram = tuple[Variables declarations, Statements programLines];
alias Variables = list[str];
alias Statements = list[str];

void generateFile(str outputPath, Tree plcModel)
{
  PlcProgram program = extractInformation(plcModel);
  generateProgram(outputPath, program);
}

void generateProgram(str outputPath, PlcProgram program) = writeFile(generatedFile(outputFile, generateOutput(program)));

list[str] generateOutput(PlcProgram program)
{
  totalFile = ["PROGRAM PLC_PRG", "VAR"];
  totalFile += program.declarations;
  totalFile += "END_VAR";
  totalFile += program.programLines;
  totalFile += "END_PROGRAM";
  return totalFile;
} 
