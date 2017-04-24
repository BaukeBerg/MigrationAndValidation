module Stripper

import FileLocations;
import IO;
import List;
import String;
import utility::FileUtility;
import utility::Debugging;

// Ability to generate a compiled file without all the comments present.
void generateStrippedFile(str fileName)
{
  startTime = startDuration();
  resetFile(generatedFile("strippedLines"));
  lines = clippedLines(fileName);
  for(lineNumber <- [0..size(lines)])
  {    
    if(0 == lineNumber % 100)
    {
      println("<100 * lineNumber/size(lines)>%");      
    }
    appendToFile(generatedFile("strippedLines"), lines[lineNumber] + "\r\n");
  }
  printDuration("line by line, using Prelude.", startTime);
  startTime = startDuration();
  addToFile(generatedFile("strippedLines2"), lines);
  printDuration("checking existence every line.", startTime);
}
list[str] clippedLines(str fileName)
{
  list[str] convertedLines = [];
  for(line <- readFileLines(testFile(fileName)))
  {
    if(0 == size(convertedLines) % 100)
    {
      println("<100 * size(convertedLines)/size(readFileLines(testFile(fileName)))>%");  
    }
    endPos = 24;
    if(contains(line, " 00 "))
    {
      endPos = 15;
    }
    else if(contains(line, "Number of errors: 0"))
    {
      break;
    }
    try
    {
      convertedLines += substring(line,0,endPos);
    }
    catch:
    {
      println("Error caught when processing <line> around line <size(convertedLines)>, expected size: <endPos>");
      convertedLines += line;
    }
  }
  println("Processed <size(convertedLines)> lines.");  
  return convertedLines;
}
  