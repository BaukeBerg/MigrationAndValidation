module CodeSysChecker

import CodesysTypes;
import List;
import String;

import utility::Debugging;
import utility::StringUtility;

public bool printLists = false;

public void printReport(PlcProgram program)
{
  int currentLine = 0;
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
        errorList += debugPrint("Missing pattern <patternType> at <startSource>-<endSource>");
      }
      
      case / Unexpanded: <sourceLine:[0-9]{5}> <programLine:[0-9]{5}> <instruction:[0-9]{2}> /:
      {
        uncoveredInsructionLines += 1;        
        errorList += debugPrint("Missing instruction <instruction> at sourceLine <sourceLine>, programLine <programLine>");        
      }
    }
  }
  bool firstLine = true;
  int startLine = 0;
  warningList = [];
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
            warningList += debugPrint("Missing first <startCount> lines of the program");
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
  
  for(line <- program.programLines)
  {
    switch(line)
    {
      case /UNKNOWN_IDENTIFIER/:
      {
        warningList += debugPrint("Found a missing address at .EXP file line <indexOf(program.programLines, line)>, Program will not compile. Verify the symbolTable generator");
      }
      case /unnamed_<wordAddress:[0-9]+>_<bitAddress:[0-3]>/:
      {
        warningList += debugPrint("Found an unnamed bitaddress: <wordAddress>.<bitAddress> at .EXP file line <indexOf(program.programLines, line)>, consider manually declaring it in the .symbolTable file.");
      }
      case /unnamed_<wordAddress:[0-9]+>/:
      {
        warningList += debugPrint("Found an unnamed address: <wordAddress> at .EXP file line <indexOf(program.programLines, line)>, consider manually declaring it in the .symbolTable file.");
      }
    }
  }
    
  programSize = currentLine - startLine + 1;
  coverage = (0 < programSize) ? 100.0 * coveredLines / programSize : 0.00 ;  
  debugPrint("-------------------- REPORT --------------------");
  debugPrint("------------------ STATISTICS ------------------");
  debugPrint("Highest counter: <currentLine>");
  debugPrint("Size of program: <programSize> lines");
  debugPrint("Covered source range: <coveredLines> lines");
  debugPrint("Uncovered patterns: <uncoveredPatterns>, total <uncoveredPatternLines> lines");
  debugPrint("Uncovered instructions: <uncoveredInsructionLines> lines");
  debugPrint("Coverage: <coverage>%");
  debugPrint("-------------------- ERRORS --------------------");
  for(error <- errorList)
  {
    debugPrint(error);    
  }
  debugPrint("------------------- WARNINGS -------------------");
  for(warning <- warningList)
  {
    debugPrint(warning);    
  }
}