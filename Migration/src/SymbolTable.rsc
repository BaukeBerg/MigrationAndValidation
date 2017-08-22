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
import utility::StringUtility;

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
  unreferencedIndex = 1 ;
  visit(generateSymbolTree(fileName))
  {
    case Declaration D:
    {
      symbolTable += processDeclaration(D);      
    }
    case UnreferencedDeclaration UD:
    {
      symbolTable += generateDeclaration("unreferenced_<unreferencedIndex>", UD);
      unreferencedIndex += 1 ;      
    } 
    case PdsComment C:
    {
      symbolTable[size(symbolTable)-1].comment = "<C>";      
    }                 
  }
  debugPrint(symbolTable, printSymbolInfo);
  return symbolTable;
}

symbol processDeclaration(&T D) = generateDeclaration("", D);
symbol generateDeclaration(str defaultName, &T D)
{
  symbol extractedSymbol = <defaultName, "", "">;
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
  return unknownIdentifier(V);
}

str retrieveComment(str variableName, symbolTable table)
{
  for(symbol <- table, variableName == symbol.name)
  {
    return symbol.comment;
  }
  return unknownIdentifier(variableName);
}

bool isWord(str address, symbolTable table) = (true == contains(address, table)) && (false == isBoolean(address, table));

bool isBoolean(str address, symbolTable table)
{
  address = stripLeading(address, "0");
  debugPrint("finding <address>");
  for(symbol <- table, address == symbol.address)
  {
    return false;
  }
  return contains(address, table);
}

str retrieveVariableName(str address, symbolTable table)
{
  for(symbol <- table, address == symbol.address)
  {
    return symbol.name;
  }
  return unknownIdentifier(address);
}

str unknownIdentifier(&T identifier)
{
  debugPrint("Unknown Identifier: <identifier>");
  return "UNKNOWN-IDENTIFIER";
}

bool contains(str address, symbolTable table) = [] != retrieveAddressList(address, table);
list[str] retrieveAddressList(str address, symbolTable table) = [ symbol.address | symbol <- table, firstIntegerString(symbol.address) ==  firstIntegerString(address) ] ;

