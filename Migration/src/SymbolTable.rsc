module SymbolTable

import FileLocations;
import IO;
import List;
import Parser;
import PC20Syntax;
import String;

import utility::Debugging;
import utility::FileUtility;
import utility::ListUtility;

alias symbolTable = list[symbol];
alias symbol = tuple[str name, str address, str comment];

private bool printSymbolInfo = false;

symbolTable loadSymbols(str symbolFile)
{  
  symbolFile = stripFileExtension(symbolFile);
  cachedFile = generatedFile("<symbolFile>.symbolTable");
  if(exists(cachedFile))
  {
    debugPrint("Loading cached symbols from file");
    return readSymbolTableFromFile(cachedFile);
  }  
  symbols = generateSymbolTable("<symbolFile>.SYM");
  writeSymbolTableToFile(cachedFile, symbols);
  debugPrint("Generated new symbol cache");
  return symbols;
}


symbolTable readSymbolTableFromFile(loc fileToParse)
{
  symbolTable table = [];
  list[str] fileContent = readFileLines(fileToParse);
  for(line <- fileContent) 
  {
    items = split(splitter, line);
    switch(size(items))
    {
      case 2:
      {      
        table += <items[0], items[1], "">;
      }
      case 3:
      {
        table += <items[0], items[1], items[2]>;
      }
    }
  }
  return table;
}

str splitter = "@" ;

void writeSymbolTableToFile(loc fileToSave, symbolTable tableToSave)
{
  totalSymbols = [];
  for(symbol <- tableToSave)
  {
    totalSymbols += "<symbol.name><splitter><symbol.address><splitter><symbol.comment>";    
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
    case PdsComment C:
    {
      symbolTable[size(symbolTable)-1].comment = "<C>";
    }                 
  }
  debugPrint(symbolTable, printSymbolInfo);
  return symbolTable;
}

symbol processDeclaration(&T D)
{
  symbol extractedSymbol = <"", "", "">;
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

str convertVariable(Variable V, symbolTable table)
{
  for(symbol <- table, trim("<V>") == symbol.name)
  {
    return symbol.address;
  }
  return UnknownIdentifier(V);
}

str retrieveComment(str Address, symbolTable table)
{
  for(symbol <- table, trim(Address) == symbol.address)
  {
    return symbol.comment;
  }
  return UnknownIdentifier(Address);
}

str UnknownIdentifier(&T identifier)
{
  println("Unknown Identifier: <identifier>");
  return "UNKNOWN-IDENTIFIER";
}
