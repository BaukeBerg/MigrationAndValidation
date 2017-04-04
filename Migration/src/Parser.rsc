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

list[sourceLine] findAmbiguousLines(str fileName) = [ <indexOf(readFileLines(fileLocation(fileName)), n), n> | n <- readFileLines(fileLocation(fileName)), isAmbiguous(n)];

private bool isAmbiguous(str textLine) = /amb(_) := parseText(textLine);

start [Pds] doParse(str fileName) = doParse(fileLocation(fileName)); 
start [Pds] doParse(loc fileLoc) = parseText(readFile(fileLoc)); 
start [Pds] parseText(str textLine) = parse(#start[Pds], textLine); 

void renderTree(str textToRender) = renderParsetree(parseText(textToRender));
void renderFile(str fileToRender) = renderParsetree(doParse(fileToRender));
