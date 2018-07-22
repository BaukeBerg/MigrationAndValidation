module CodeSysChecker

import CodesysTypes;
import FileLocations;
import IO;
import List;
import String;

import utility::Debugging;
import utility::FileUtility;
import utility::StringUtility;

public bool printLists = false;

public void validateAndReport(PlcProgram program) = validateAndReport("PC20_Cycle", program);
public void validateAndReport(str reportName, PlcProgram program)
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
  
  indentDepth = 0;
  maxIndentDepth = 0;
  reportWarnings = true;
  for(line <- [0..size(program.programLines)])
  {
    switch(program.programLines[line])
    {
      case /IF /:
      {
        indentDepth += 1;
        if(indentDepth > maxIndentDepth)
        {
          maxIndentDepth = indentDepth;
        } 
        if((indentDepth >= 3)
          && reportWarnings)
        {
          warningList += debugPrint("Threshold for indent depth exceeded, Possible issue with generating end_if statements around line <line>");
          reportWarnings = false;
        }        
      }
      
      case /END_IF;/:
      {
        indentDepth -= 1;
        reportWarnings = true;
      }
      
      case /UNKNOWN_IDENTIFIER/:
      {
        warningList += debugPrint("Found a missing address at .EXP file line <line>, Program will not compile. Verify the symbolTable generator");
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
  
  bool endIfFound = false;
  ifCount = endIfCount = 0;
  for(line <- reverse(program.programLines))
  {
      switch(line)
      {
      case /END_IF;/:
      {
        endIfFound = true;
        endIfCount += 1;
      }  
      case /IF /:
      {
        ifCount += 1;
        if(!endIfFound)
        {
          errorList += handleError("non-terminated IF-statement found at line <indexOf(program.programLines, line)>, program will not compile");          
        }
      }
    }
    
  }
  if(ifCount != endIfCount)
  {
    errorList += handleError("not all if-statements are terminated <ifCount> if-statements vs <endIfCount> end_if statements");
  }
    
  programSize = currentLine - startLine + 1;
  coverage = (0 < programSize) ? 100.0 * coveredLines / programSize : 0.00 ;  
  reportLines = [];
  reportLines += debugPrint("-------------------- REPORT --------------------");
  reportLines += debugPrint("Report date time: <timeStamp()>");
  reportLines += debugPrint("Conversion duration: <formatDuration()>");
  reportLines += debugPrint("Program complete: <yesOrNo(100.0 == coverage)>");
  reportLines += debugPrint("------------------ STATISTICS ------------------");
  reportLines += debugPrint("Highest counter: <currentLine>");
  reportLines += debugPrint("Size of program: <programSize> lines");
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

str yesOrNo(bool valueToCheck) = valueToCheck ? "yes!" : "NO" ;