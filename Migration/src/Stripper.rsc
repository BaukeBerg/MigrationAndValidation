module Stripper

import FileLocations;
import IO;
import List;
import String;
import utility::FileUtility;
import utility::Debugging;

// Ability to generate a compiled file without all the comments present.
void generateStrippedFile(str fileName) = addToFile(generatedFile("strippedLines"), clippedLines(fileName));

list[str] clippedLines(str fileName)
{
  list[str] convertedLines = [];
  for(line <- readFileLines(testFile(fileName)))
  {
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


  