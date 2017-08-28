module CodeSysGenerator

import FileLocations;
import IO;
import List;
import ParseTree;
import PC20Syntax;
import String;
import SymbolTable;

import utility::Debugging;
import utility::FileUtility;
import utility::MathUtility;
import utility::StringUtility;

alias PlcProgram = tuple[Variables declarations, Statements programLines];
alias Variables = list[str];
alias Statements = list[str];

void generateFile(str outputPath, Tree plcModel, symbolTable symbols)
{
  PlcProgram program = extractInformation(plcModel, symbols);
  generateProgram(outputPath, program);
}

PlcProgram extractInformation(Tree plcModel, symbolTable symbols)
{
  programLines = [];
  visit(plcModel)
  {
    case AssignConstant A:
    {
      programLines += extractStatements(A, symbols);
    }
  }
  return <convertSymbols(symbols),programLines>;
}

Statements extractStatements(AssignConstant A, symbolTable symbols)
{
  constantValue = -1;
  statements = ["(* <A> *)"];
  addresses = [];
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
          addresses += "<stripLeading("<F>", "0")>";
        }
      }
    }      
  }
  for(address <- addresses)
  {
    statements += evaluateAssign(symbols, address, constantValue);  
  }
  return statements;
}

Statements evaluateAssign(symbolTable symbols, str address, int constantValue)
{
  if(true == isBoolean(address, symbols))
  {
    Statements statements = [];
    for(bitAddress <- retrieveAddressList(address, symbols))
    {
      variableName = retrieveVariableName(bitAddress, symbols);
      println(variableName);
      statements += "<variableName> := <getBit(constantValue, lastInteger(bitAddress))> ; (* <retrieveComment(variableName, symbols)> *)";
    }
    return statements;
  }
  return ["<address> := <constantValue> ;"];
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
 