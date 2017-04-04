module Parser

import Ambiguity;
import PC20Syntax;
import ParseTree;
import vis::ParseTree;
import String;
import IO;

// Test file calls
str testFilePath = "file:///C:/Users/310283735/Desktop/MigrationAndValidation/Migration/testFiles/";
loc fileLocation(str fileName) = toLocation(testFilePath + fileName);

alias sourceLine = tuple[int line, str text] ; 

public int parseFile(str fileName) 
{
  int parseResult = 0;
  try 
  {
    list[sourceLine] ambiguousLines = findAmbiguousLines(fileName);
    if(isEmpty(ambiguousLines))
    {
      println("--- SUCCESS on parsing <fileName> ---");
    }
    else
    { 
      for(line <- ambiguousLines)
      {      
        println("<line.line>:<line.text>"); 
        iprintln(diagnose(parseText(line.text)));
      }
      println("--- AMBIGUITIES found whilst parsing <fileName>");
      parseResult = 1;      
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
private bool isAmbiguous(str textLine) = /amb(_) := parseText(textLine);

start [Pds] doParse(str fileName) = doParse(fileLocation(fileName)); 
start [Pds] doParse(loc fileLoc) = parseText(readFile(fileLoc)); 
start [Pds] parseText(str textLine) = parse(#start[Pds], textLine); 

// render functions (trees)
void renderTree(str textToRender) = renderParsetree(parseText(textToRender));
void renderFile(str fileToRender) = renderParsetree(doParse(fileToRender));