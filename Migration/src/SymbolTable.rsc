module SymbolTable

import IO;
import Parser;
import PC20Syntax;

alias symbolTable = list[symbol];
alias symbol = tuple[str name, str address, str comment];

symbolTable generateSymbolTable(str fileName)
{
  symbolTable = [];
  visit(parseSymbol(fileName))
  {
    case Declaration D:
        symbolTable += processDeclaration(D);
    case PdsComment C:
        println(C);
    case UnreferencedDeclaration UD:
      println(UD);
                  
  }
  iprintln(symbolTable);
  return symbolTable;
}

symbol processDeclaration(&T D)
{
  symbol extractedSymbol = <"", "", "">;
  visit(D)
  {
    case VariableName N:
    {
      println("<N>");
      extractedSymbol.name = "trim(<N>)";
    }
    case Address A:
    {
      extractedSymbol.address = "trim(<A>)";
    }
    case PdsComment C:
    {
      extractedSymbol.comment = "<C>";
    }      
  }  
  return extractedSymbol;     
}