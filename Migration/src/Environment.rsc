module Environment

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

alias SymbolTable = list[Symbol];
alias Symbol = tuple[str name, str address, str comment, str dataType];

private bool printSymbolInfo = false;

SymbolTable loadSymbols(str symbolFile)
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


SymbolTable readSymbolTableFromFile(loc fileToParse)
{
  table = [];
  list[str] fileContent = readFileLines(fileToParse);
  for(line <- fileContent) 
  {
    items = split(splitter, line);
    switch(size(items))
    {
      case 2:
      {      
        table += <items[0], items[1], "", "">;
      }
      case 3:
      {
        table += <items[0], items[1], items[2], "">;
      }
    }
  }
  return table;
}

str splitter = "@" ;

void writeSymbolTableToFile(loc fileToSave, SymbolTable tableToSave)
{
  totalSymbols = [];
  for(symbol <- tableToSave)
  {
    totalSymbols += "<symbol.name><splitter><symbol.address><splitter><symbol.comment>";    
  }
  writeToFile(fileToSave, totalSymbols);  
}

SymbolTable generateSymbolTable(str fileName)
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

Symbol processDeclaration(&T D) = generateDeclaration("", D);
Symbol generateDeclaration(str defaultName, &T D)
{
  symbol extractedSymbol = <defaultName, "", "", "">;
  visit(D)
  {
    case VariableName N:
    {
      debugPrint("<N>", printSymbolInfo);
      extractedSymbol.name = "<trim("<N>")>";
    }
    case Address A:
    {
      extractedSymbol.address = "<stripLeading(trim("<A>"), "0")>";
    }     
  }  
  return extractedSymbol;     
}

str convertVariable(Variable V, SymbolTable table)
{
  for(symbol <- table, trim("<V>") == symbol.name)
  {
    return symbol.address;
  }
  return unknownIdentifier(V);
}

str retrieveComment(str variableName, SymbolTable table)
{
  variableName = clipAndStrip(variableName);
  for(symbol <- table, (variableName == symbol.name) || (variableName == symbol.address))
  {
    return symbol.comment;
  }
  return unknownIdentifier(variableName);
}

bool isWord(str address, SymbolTable table) = (true == contains(address, table)) && (false == isBoolean(address, table));

bool isBoolean(str address, SymbolTable table)
{
  address = clipAndStrip(address);  
  for(symbol <- table, address == symbol.address)
  {
    return false;
  }
  return contains(address, table);
}

str retrieveVariableName(str address, SymbolTable table)
{
  address = clipAndStrip(address);
  for(symbol <- table, address == symbol.address)
  {
    return replaceAll(symbol.name, ",", "_");
  }
  return unknownIdentifier(address);
}

str clipAndStrip(str variableInfo) = stripLeading(trim(variableInfo), "0");

str unknownIdentifier(&T identifier)
{
  debugPrint("Unknown Identifier: <identifier>");
  return "UNKNOWN-IDENTIFIER";
}

bool contains(str address, SymbolTable table) = [] != retrieveAddressList(address, table);
list[str] retrieveAddressList(str address, SymbolTable table)
{
  symbols = [];
  targetAddress = wordAddress(stripLeading(address, "0"));
  for(symbol <- table)
  {
    actualAddress = wordAddress(symbol.address);
    if(targetAddress == actualAddress)
    {
      symbols += symbol.address;
      if(4 == size(symbols))
      {
        break;
      }
    }        
  }
  return symbols;
}    

// Local optimization due to bad performance of the firstInteger() on loop based calls
str wordAddress(str address)
{
  dotPos = findFirst(address, ".");
  if(-1 != dotPos)
  {
    return substring(address, 0, dotPos);
  }
  return address;    
}
