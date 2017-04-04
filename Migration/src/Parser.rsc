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

public int parseFile(str fileName) 
{
  int parseResult = 0;
  try 
  {
    if( /amb(_) := doParse(fileName)) 
    {
      tuple[int line, str text] info = <0, "">;
      try
      {
        for(tempLine <- readFileLines(fileLocation(fileName)))
        {        
          info.line += 1 ;
          info.text = tempLine;              
          if(isAmbiguous(tempLine))
          {
            println("<info.line>:<info.text>");
            iprintln(diagnose(parseText(info.text)));
          }        
        }            
      }         
      catch:
      {
        println("ERROR while trying to parse <info.line>:<info.text>");
        parseResult = 1;
      }
      println("--- AMBIGUOUS result whilst parsing <fileName> --- ");
      parseResult = 2;       
    }    
    else
    {
      println("--- SUCCESSFULLY parsed <fileName> ---");
    }
  }
  catch: 
  {
    println("--- ERROR while parsing <fileName> ---");
    parseResult = 3 ;
        
  }  
  return parseResult;
}

private bool isAmbiguous(str textLine) = /amb(_) := parseText(textLine);

start [Pds] doParse(str fileName) = doParse(fileLocation(fileName)); 
start [Pds] doParse(loc fileLoc) = parseText(readFile(fileLoc)); 
start [Pds] parseText(str textLine) = parse(#start[Pds], textLine); 

void renderTree(str textToRender) = renderParsetree(parseText(textToRender));
void renderFile(str fileToRender) = renderParsetree(doParse(fileToRender));


