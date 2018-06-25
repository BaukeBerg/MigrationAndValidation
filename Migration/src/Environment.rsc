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
import utility::MathUtility;
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
  commentDeclarations = 0;
  unreferencedIndex = 0;
  unnamed = false;
  visit(generateSymbolTree(fileName))
  {
    case Declaration D:
    {
      unnamed = false;
      symbolTable += processDeclaration(D);      
    }
    case UnnamedDeclaration UD:
    {
      unnamed = true;
      addressName = replaceAll(trim("<UD>"), ".", "_");
      addressName = replaceAll(addressName, "=", "");
      symbolTable += generateDeclaration("unnamed_<trim(addressName)>", UD);   
      unreferencedIndex += 1;         
    } 
    case PdsComment C:
    {
      if(unnamed)
      {
        symbolTable[size(symbolTable)-1].name = composeVariableName("<C>");
        unreferencedIndex -= 1;
        commentDeclarations += 1;
        unnamed = false;
      }
      symbolTable[size(symbolTable)-1].comment = "<C>";
            
    }                 
  }
  debugPrint(symbolTable, printSymbolInfo);
  debugPrint("Total amount of declarations: <size(symbolTable)>");
  debugPrint("Amount of unnamed variables without comment: <unreferencedIndex>");
  debugPrint("Amount of unnamed variables with comment: <commentDeclarations>");  
  return symbolTable;
}

Symbol processDeclaration(&T D) = generateDeclaration("", D);
Symbol generateDeclaration(str defaultName, &T D)
{
  Symbol extractedSymbol = <defaultName, "", "", "">;
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

str composeVariableName(str comment)
{
  comment = stripLeading(comment, "!");
  comment = trim(comment);
  comment = replaceAll(comment, " ", "_");
  if(inLimits("0", comment[0], "9"))
  {
    comment = "_" + comment;
  }
  return comment;
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

str clipAndStrip(str variableInfo)
{
  variableInfo = stripLeading(trim(variableInfo), "0");
  if(startsWith(variableInfo, "."))
  {
    return "0" + variableInfo;
  }
  return variableInfo;  
}


str unknownIdentifier(&T identifier)
{
  handleError("Unknown Identifier: <identifier>");
  return "UNKNOWN_IDENTIFIER";
}

bool contains(str address, SymbolTable table)
{
  presentDeclarations = retrieveAddressList(address, table);
  if(contains(address, "."))
  {
    return address in presentDeclarations;
  }
  return 0 < size(presentDeclarations);
}
list[str] retrieveAddressList(str address, SymbolTable table)
{
  symbols = [];
  targetAddress = debugPrint("Scanning for:", wordAddress(clipAndStrip(address)));
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

