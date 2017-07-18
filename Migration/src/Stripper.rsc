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
  targetFile = generatedFile("<fileName.file>.stripped"); 
  if(!exists(targetFile))
  {
    writeToFile(targetFile ,fileData);
  }
  return fileData;
}

list[str] clippedLines(loc fileName) = clipLines(readFileLines(fileName));
list[str] clipLines(list[str] lines)
{
  list[str] convertedLines = [];
  for(line <- lines)
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
      println("Error caught when processing --|<line>|-- around line <size(convertedLines)>, expected: <endPos>, received: <size(line)>");
      convertedLines += line;
    }
  }
  println("Processed <size(convertedLines)> lines.");  
  return convertedLines;
}

int findEndPos(str lineToCheck) = size(lineToCheck) >= 24 ? 24 : 15 ;

list[str] instructionList(list[str] clippedLines)
{
  intructions = [];
  clippedLines = clipLines(clippedLines);  
  for(line <- clippedLines, isProgramLine(line))
  {
    intructions += trim(substring(line, 12));
  }
  return intructions;
}

bool isProgramLine(str lineToCheck) = -1 != getProgramLine(lineToCheck);