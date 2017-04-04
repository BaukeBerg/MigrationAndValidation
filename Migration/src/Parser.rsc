module Parser

import Ambiguity;
import PC20Syntax;
import ParseTree;
import vis::ParseTree;
import String;
import IO;

str testFilePath = "file:///C:/Users/310283735/Desktop/MigrationAndValidation/Migration/testFiles/";

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

private bool isAmbiguous(str textLine)
{
  return /amb(_) := parseText(textLine);
}
  

void subRoutine()
{
  checkAndRender("simpleRoutine");
}

void simpleLabel()
{
  checkAndRender("simpleLabel"); 
}

void checkAndRender(str fileName)
{
  if(0 == parseFile(fileName))
  {
    renderFile(fileName);
  }  
}

start [Pds] doParse(str fileName) = doParse(fileLocation(fileName)); // parse a test file based on its file name
start [Pds] doParse(loc fileLoc) = parseText(readFile(fileLoc)); // parse any file based on its location
start [Pds] parseText(str textLine) = parse(#start[Pds], textLine); // parse any text
bool isUnambiguous(str textToParse) = /amb(_) !:= parseText(textToParse); // validate any text for unambiguity
void renderTree(str textToRender) = renderParsetree(parseText(textToRender));
void renderFile(str fileToRender) = renderParsetree(doParse(fileToRender));
void diagnoseFile(str fileToDiagnose) = diagnose(doParse(fileToDiagnose));

loc fileLocation(str fileName) = toLocation(testFilePath + fileName);


