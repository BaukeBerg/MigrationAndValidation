module Parser

import Ambiguity;
import PC20Syntax;
import ParseTree;
import vis::ParseTree;
import String;
import IO;

// Test file calls
loc fileLocation(str fileName) = toLocation(testFilePath + fileName);
str testFilePath = "project://Migration/testFiles/";

alias sourceLine = tuple[int line, str text] ; 

public int parseFile(str fileName) 
{
  int parseResult = 0;
  try 
  {
    if(/amb(_) := doParse(fileName))
    {
      parseResult = 1;      
      list[sourceLine] ambiguousLines = findAmbiguousLines(fileName);
      loc ambiguityFile = fileLocation("lastAmbiguity");
      writeFile(ambiguityFile, "");      
      for(line <- ambiguousLines)
      {
        appendToFile(ambiguityFile, "<line.text>\r\n"); 
        println("<line.line>:<line.text>");        
        iprintln(diagnose(parseText(line.text)));
      }   
    }
    else
    {
      println("--- SUCCESS on parsing <fileName> ---");
    }     
  }
  catch: 
  {
    println("--- ERROR while parsing <fileName> ---");
    parseResult = 2 ;        
  }  
  return parseResult;
}

// file utilities
list[sourceLine] findAmbiguousLines(str fileName) = [ n | n <- readFile(fileName), isAmbiguous(n.text)];
list[sourceLine] readFile(str fileName) = [ <n, fileLines(fileName)[n-1]> | n <- [0 .. fileSize(fileName)]];
int fileSize(str fileName) = size(fileLines(fileName));
list[str] fileLines(str fileName) = readFileLines(fileLocation(fileName));

// parse functions
private bool isAmbiguous(str textLine)
{
  try
  {
    return /amb(_) := parseText(textLine);
  }
  catch:
  {
    ;
  }
  return false;
}

start [Pds] doParse(str fileName) = doParse(fileLocation(fileName)); 
start [Pds] doParse(loc fileLoc) = parseText(readFile(fileLoc)); 
start [Pds] parseText(str textLine) = parse(#start[Pds], textLine); 

// render functions (trees)
void renderFile(str fileToRender) = renderParsetree(doParse(fileToRender));

// test calls
test bool testAmbiguities() = 0 == parseFile("ambiguityIssues");
