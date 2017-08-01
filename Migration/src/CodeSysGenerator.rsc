module CodeSysGenerator

import FileLocations;
import List;
import ParseTree;
import PC20Syntax;
import String;
import SymbolTable;

import utility::Debugging;
import utility::FileUtility;
import utility::StringUtility;

alias PlcProgram = tuple[Variables declarations, Statements programLines];
alias Variables = list[str];
alias Statements = list[str];

void generateFile(str outputPath, Tree plcModel)
{
  PlcProgram program = extractInformation(plcModel);
  generateProgram(outputPath, program);
}

PlcProgram extractInformation(Tree plcModel)
{
  programLines = [];
  visit(plcModel)
  {
    case AssignConstant A:
    {
      programLines += extractStatements(A);
    }
  }
  return <[],programLines>;
}

Statements extractStatements(AssignConstant A)
{
  constantValue = -1;
  statements = ["(* <A> *)"];
  variables = [];
  debugPrint("Generating asssing <A>");
  visit(A)
  {
    case ConstantValue C:
    {
      constantValue = parseInt("<C>");     
    }
    case AddressRange A:
    {
      visit(A)
      {
        case FiveDigits F:
        {
          variables += "<F>";
        }
      }
    }      
  }
  for(variable <- variables)
  {
    statements += "<variable> := <constantValue> ;";  
  }
  return statements;
}

void generateProgram(str outputPath, PlcProgram program) = writeToFile(generatedFile(outputPath), generateOutput(program));
list[str] generateOutput(PlcProgram program)
{
  totalFile = ["PROGRAM PLC_PRG", "VAR"];
  totalFile += program.declarations;
  totalFile += "END_VAR";
  totalFile += program.programLines;
  totalFile += "END_PROGRAM";
  return totalFile;
} 

Variables convertSymbols(symbolTable symbols) = [ extractVariable(plcSymbol) | plcSymbol <- symbols ];

str extractVariable(symbol plcSymbol)
{
  name = replaceAll(plcSymbol.name, ",", "_");
  dataType = typeString(plcSymbol.address);
  suffix = "; (* <plcSymbol.address> <plcSymbol.comment> *)";
  return "\t<name> : <dataType> <suffix>";
}

str typeString(str address) = contains(address, ".") ? "BOOL" : "INT" ;
 