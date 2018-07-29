module CodeSysChecker

import CodesysTypes;
import DataTypes;
import FileLocations;
import IO;
import List;
import String;

import utility::Debugging;
import utility::FileUtility;
import utility::StringUtility;

public bool printLists = false;

public void validateAndReport(PlcProgram program) = validateAndReport(program, "");
public void validateAndReport(PlcProgram program, str compiledFileName) = validateAndReport("PC20_Cycle", program, compiledFileName);
public void validateAndReport(str reportName, PlcProgram program, str compiledFileName)
{
  warningList = [];
  SourceRange fileRange = <0,-1>;
  if(isEmpty(compiledFileName))
  {
    warningList += "No original file supplied, consider passing the .compiled file for additional checking!"; 
  }
  else
  {
    fileRange = extractSourceRange(compiledFile(compiledFileName));        
  }
  
  int coveredLines = 0;
  debugPrint("Amount of declarations: <size(program.declarations)>");
  debugPrint("Amount of source code lines: <size(program.programLines)>");
  unexpandedlines = [ line | line <- program.programLines, contains(line, "(* Unexpanded:")]; 
  coveredRange = [ line | line <- program.programLines, contains(line, "(* ++")];
  debugPrint("Unexpanded lines: <unexpandedlines>", printLists);
  debugPrint("Covered range: <coveredRange>", printLists);
  
  for(line <- coveredRange)
  {
    switch(line)
    {
      case / <startSource:[0-9]{5}>-<endSource:[0-9]{5}> /:
      {
        coveredLines += firstInteger(endSource) - firstInteger(startSource) + 1;        
      }
    }
  }
  int uncoveredPatterns = 0;
  int uncoveredPatternLines = 0;
  int uncoveredInsructionLines = 0;
  errorList = [];
  for(line <- unexpandedlines)
  {
    switch(line)
    {
      // Highest priority, a Source Range is present
      case /<startSource:[0-9]{5}>-<endSource:[0-9]{5}> is <patternType:\w+>/:
      {
        uncoveredPatterns += 1;
        uncoveredPatternLines += firstInteger(endSource) - firstInteger(startSource) + 1;        
        errorList += debugPrint("No code generated for pattern <patternType> at <startSource>-<endSource>");
      }
      
      case / Unexpanded: <sourceLine:[0-9]{5}> <programLine:[0-9]{5}> <instruction:[0-9]{2}> /:
      {
        uncoveredInsructionLines += 1;        
        errorList += debugPrint("No code generated for instruction <instruction> at sourceLine <sourceLine>, programLine <programLine>");        
      }
    }
  }
  bool firstLine = true;
  int startLine = 0;
  int currentLine = fileRange.firstLine-1;
  for(line <- program.programLines)
  {
    switch(line)
    {
      case /<startSource:[0-9]{5}>-<endSource:[0-9]{5}> is <patternType:\w+>/:
      {
        startCount = firstInteger(startSource);
        endCount = firstInteger(endSource);
        if((startCount - currentLine) != 1)
        {
          if(firstLine)
          {
            errorList += debugPrint("Missing first <startCount-currentLine> lines of the program");
          }
          else
          {           
            errorList += handleError("Missing part of program between line <currentLine> and <startCount>");
          }          
        }
        currentLine = endCount;
        if(firstLine)
        {
          startLine = startCount;
          firstLine = false;
        }
      }
    }    
  }
  if(currentLine != fileRange.lastLine)
  {
    if(currentLine < fileRange.lastLine)
    {
      errorList += handleError("Missing last <fileRange.lastLine-currentLine> lines fo the program");
    }
    else
    {
      errorList += handleError("Program counter exceeds input file size. Expected: <fileRange.lastLine>, Received: <currentLine>");
    }   
  }
  indentDepth = 0;
  atIndentCount = 0;
  maxIndentDepth = 0;
  reportWarnings = true;
  blankLines = 0; 
  commentedLines = 0;
  ifCount = endIfCount = 0;
  bool endIfFound = false;
  int lastIf = 0;
  indentList = [];
  for(line <- [0..size(program.programLines)])
  {
    switch(program.programLines[line])
    {
      case /^\s*IF /:
      {
        ifCount += 1;
        lastIf = line;
        endIfFound = false;
        indentDepth += 1;
        indentList += "<indentDepth> @ <line>";
        if(indentDepth > maxIndentDepth)
        {
          maxIndentDepth = indentDepth;
        } 
        if((indentDepth >= 5)
          && reportWarnings)
        {
          warningList += debugPrint("Threshold for indent depth exceeded, Possible issue with generating end_if statements around line <line>");          
        }        
        reportWarnings = indentDepth < 5;
      }
      
      case /^\s*$/:
      {
        debugPrint("BlankLine");
        blankLines += 1;
      }
      
      case /^\s*;?\s*\(\*/:
      {
        debugPrint("Commented line");
        commentedLines += 1;        
      }
      
      case /END_IF;/:
      {
        endIfCount += 1;
        indentDepth -= 1;
        indentList += "<indentDepth> @ <line>";
        if(0 > indentDepth)
        {
          errorList += handleError("Indent depth smaller than 0, code error at line <line>");
        }
        reportWarnings = true;
        endIfFound = true;
        if(0 == indentDepth)
        {
          atIndentCount = 0;
        }
        else
        {
          atIndentCount += 1;
        }
        if(5 <= atIndentCount)
        {
          warningList += debugPrint("Possible missing END_IF around line <line>");
          indentDepth = 0; 
        } 
      }
      
      case /UNKNOWN_IDENTIFIER/:
      {
        errorList += debugPrint("Found a missing address at .EXP file line <line>, Program will not compile. Verify the symbolTable generator");
      }
      case /unnamed_<wordAddress:[0-9]+>_<bitAddress:[0-3]>/:
      {
        warningList += debugPrint("Found an unnamed bitaddress: <wordAddress>.<bitAddress> at .EXP file line <line>, consider manually declaring it in the .symbolTable file.");
      }
      case /unnamed_<wordAddress:[0-9]+>/:
      {
        warningList += debugPrint("Found an unnamed address: <wordAddress> at .EXP file line <line>, consider manually declaring it in the .symbolTable file.");
      }
    }
  }
  writeToFile(generatedFile("indentList.txt"), indentList);
  if(!endIfFound)
  {
    errorList += handleError("non-terminated IF-statement found at line <lastIf>, program will not compile");          
  }  
  
  if(ifCount != endIfCount)
  {
    errorList += handleError("not all if-statements are terminated <ifCount> if-statements vs <endIfCount> end_if statements");
  }
    
  programSize = fileRange.lastLine - fileRange.firstLine + 1;
  coverage = (0 < programSize) ? coveredLines * 100.0 / programSize : 0.00 ;
  fileSize = size(program.programLines);
  linesOfCode = fileSize-commentedLines-blankLines;
  reduction =  (0 < programSize) ? 100.0 * (programSize - coveredLines) / programSize : 0.00 ;
  reportLines = [];
  reportLines += debugPrint("-------------------- REPORT --------------------");
  reportLines += debugPrint("Report date time: <timeStamp()>");
  reportLines += debugPrint("Conversion duration: <formatDuration()>");
  reportLines += debugPrint("Source file: <compiledFileName>");
  reportLines += debugPrint("All instructions covered: <yesOrNo(100.0 == coverage)>");
  reportLines += debugPrint("Conversion successful: <yesOrNo(isEmpty(errorList))>");
  reportLines += debugPrint("------------------- DETAILS -------------------");  
  reportLines += debugPrint("Highest index of program counter: <currentLine>");
  reportLines += debugPrint("Size of program : <programSize> lines.");
  reportLines += debugPrint("Program counter range: <fileRange.firstLine> to <fileRange.lastLine>");
  reportLines += debugPrint("Total file size: <fileSize>");
  reportLines += debugPrint("Amount of blank lines: <blankLines>");
  reportLines += debugPrint("Amount of commented lines: <commentedLines>");
  reportLines += debugPrint("Total lines with instructions: <linesOfCode>");
  reportLines += debugPrint("Reduction of code size: <formatReal(reduction)>%");
  reportLines += debugPrint("Amount of if-statements: <ifCount>");
  reportLines += debugPrint("Maximum indent depth: <maxIndentDepth>");
  reportLines += debugPrint("Covered source range: <coveredLines> lines");
  reportLines += debugPrint("Uncovered patterns: <uncoveredPatterns>, total <uncoveredPatternLines> lines");
  reportLines += debugPrint("Uncovered instructions: <uncoveredInsructionLines> lines");
  reportLines += debugPrint("Coverage: <formatReal(coverage,2)>%");
  reportLines += debugPrint("-------------------- ERRORS --------------------");
  for(error <- errorList)
  {
    reportLines += debugPrint(error);    
  }
  reportLines += debugPrint("------------------- WARNINGS -------------------");
  for(warning <- warningList)
  {
    reportLines += debugPrint(warning);    
  }
  writeToFile(generatedFile("<fileTimeStamp()>_<reportName>.txt"), reportLines);
}

str yesOrNo(bool valueToCheck) = valueToCheck ? "YES!" : "NO" ;

SourceRange extractSourceRange(loc fileToCheck)
{
  content = readFileLines(fileToCheck);
  return <firstSourceLine(content), firstSourceLine(reverse(content))>;  
}

int firstSourceLine(list[str] content)
{
  for(line <- content)
  {
    switch(line)
    {
      case /[0-9]{5}\s<sourceLine:[0-9]{5}>/:
      {
        return parseInt(sourceLine);        
      }
    }  
  }
  return -1;
}
