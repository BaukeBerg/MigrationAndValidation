module Parser

import PdsSyntax;
import ParseTree;
import vis::ParseTree;
import String;
import IO;

str testFilePath = "file:///C:/Users/310283735/Desktop/MasterThesis/Migration/sampleFiles/";

public int parseFile(str fileName) 
{
  int parsingResult = 0 ;
  try
  {
    if( /amb(_) := doParse(fileName))
    {
      println("--- AMBIGUOUS result when parsing <fileName> ---");
      parsingResult = 1;
    }
    else
    {
      println("--- SUCCESS when parsing <fileName> ---");      
    }
  }
  catch:
  {
    parsingResult = 2;
    println("--- ERROR while parsing <fileName> ---");
  }
  // return parsedTree;
  return parsingResult;
}

start [Pds] doParse(str fileName) = doParse(toLocation(testFilePath + fileName)); // parse a test file based on its file name
start [Pds] doParse(loc fileLoc) = parseText(readFile(fileLoc)); // parse any file based on its location
start [Pds] parseText(str textLine) = parse(#start[Pds], textLine); // parse any text
bool isUnambiguous(str textToParse) = /amb(_) !:= parseText(textToParse); // validate any text for unambiguity
void renderTree(str textToRender) = renderParsetree(parseText(textToRender));
void renderFile(str fileToRender) = renderParsetree(doParse(fileToRender));


