module Stripper

import FileLocations;
import IO;
import String;
import utility::FileUtility;


void generateStrippedFile(str fileName) = writeToFile(generatedFile("strippedLines"), clippedLines(fileName));
list[str] clippedLines(str fileName)
{
  list[str] convertedLines = [];
  for(line <- readFileLines(testFile(fileName)))
  {
    if(contains(line, "Number of errors"))
    {
      break;
    }
    try
    {
      convertedLines += substring(line,0,24);
    }
    catch:
    {
      convertedLines += line;
    }
  }
  return convertedLines;
}
  