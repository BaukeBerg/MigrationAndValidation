module SymbolTable

import IO;
import Parser;
import PC20Syntax;
import String;

import utility::Debugging;

alias symbolTable = list[symbol];
alias symbol = tuple[str name, str address];

private bool printSymbolInfo = false;

symbolTable generateSymbolTable(str fileName)
{
  symbolTable = [];
  visit(generateSymbolTree(fileName))
  {
    case Declaration D:
    {
      symbolTable += processDeclaration(D);      
    }
    case UnreferencedDeclaration UD:
    {
      println("Unreferenced declaration: <UD>");
    }                  
  }
  debugPrint(symbolTable, printSymbolInfo);
  return symbolTable;
}

symbol processDeclaration(&T D)
{
  symbol extractedSymbol = <"", "">;
  visit(D)
  {
    case VariableName N:
    {
      debugPrint("<N>", printSymbolInfo);
      extractedSymbol.name = "<trim("<N>")>";
    }
    case Address A:
    {
      extractedSymbol.address = "<trim("<A>")>";
    }       
  }  
  return extractedSymbol;     
}