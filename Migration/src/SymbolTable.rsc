module SymbolTable

import IO;
import Parser;
import PC20Syntax;
import String;

import utility::Debugging;
import utility::FileUtility;
import utility::ListUtility;

alias symbolTable = list[symbol];
alias symbol = tuple[str name, str address];

private bool printSymbolInfo = false;

symbolTable readSymbolTableFromFile(loc fileToParse)
{
  symbolTable table = [];
  list[str] fileContent = readFileLines(fileToParse);
  for(line <- fileContent) 
  {
    items = split(",",line);
    table += <items[0], items[1]>;    
  }
  return table;
}

void writeSymbolTableToFile(loc fileToSave, symbolTable tableToSave)
{
  totalSymbols = [];
  for(symbol <- tableToSave)
  {
    totalSymbols += "<symbol.name>,<symbol.address>";    
  }
  writeToFile(fileToSave, totalSymbols);  
}

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

