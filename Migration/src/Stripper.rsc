module Stripper

import Compiler;
import FileLocations;
import IO;
import List;
import String;
import utility::FileUtility;
import utility::Debugging;

// Ability to generate a compiled file without all the comments present.
void generateStrippedFile(str fileName) = writeToFile(generatedFile("<filename>.stripped"), clippedLines(testFile(fileName)));

list[str] clipAndSave(loc fileName)
{
  fileData = clippedLines(fileName);
  writeToFile(generatedFile("<fileName.file>.stripped") ,fileData);
  return fileData;
}

list[str] clippedLines(loc fileName)
{
  list[str] convertedLines = [];
  for(line <- readFileLines(fileName))
  {
    endPos = findEndPos(line);
    if(contains(line, "Number of errors: 0"))
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

list[str] instructionList(list[str] clippedLines)
{
  intructions = [];
  for(line <- clippedLines, isProgramLine(line))
  {
    intructions += trim(substring(line, 12));
  }
  return intructions;
}

bool isProgramLine(str lineToCheck) = -1 != getProgramLine(lineToCheck);

int findEndPos(str lineToCheck) = size(lineToCheck) >= 24 ? 24 : 15 ;