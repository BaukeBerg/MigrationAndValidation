module testModule::TestGenerator

import FileLocations;
import IO;
import String;

import utility::FileUtility;
import utility::HtmlUtility;
import utility::ListUtility;
import utility::StringUtility;
import utility::TestUtility;

// generates a rascal module with all the unit tests
// Both the separate unit tests as
public void generateTestModule()
{
  list[loc] testFiles = enumerateDirFiles(testDir);
  list[str] fileNames = fileName(testFiles);
  fileNames = stripFileExtension(fileNames);
  fileNames = padList("import \\testModule::", fileNames, ";");
  fileNames += "\r\n";
  list [str] testCalls = [];
  list[str] functionDefinitions = [];
  for(testFile <- testFiles)
  {
    for(line <- readFileLines(testFile))
    {
      if(startsWith(line, "test bool "))
      {
        str tryCatchFunction = createTryCatchHarness(stripFileExtension(fileName(testFile)), testMethodName(line));  
        functionDefinitions += tryCatchFunction;
        testCalls += testMethodName(tryCatchFunction);
      }
    }
  } 
  testCalls = padList("  if(false == ", testCalls, "){ result = false;}");
  createTestModule(fileNames + functionDefinitions, testCalls);
  removeReport();
}

str testMethodName(str methodLine) = stringToken(methodLine, "bool ", findFirst(methodLine, "()"))+ "()";

void createTestModule(list[str] modules, list[str] testCalls)
{
  loc testModule = generatedFile("MainTestModule.rsc");
  resetFile(testModule);
  addToFile(testModule, "module generated::MainTestModule\r\n\r\n<joinList(modules)>\r\n\r\n");
  addToFile(testModule, "bool runAllTests()\r\n{\r\n  initializeTestReport();\r\n  bool result = true;\r\n<joinList(testCalls, "\r\n")>\r\n  finalizeTestReport();\r\n  return result;\r\n}");
}

void printResult(bool result) = result ? print("true") : print("false");

str createTryCatchHarness(str moduleName, str methodName) = "test bool try<methodName>{ try{ return <createTestCall(moduleName, methodName)>;} catch: { <failTestCall(moduleName, methodName)>; } return false; }";
str createTestCall(str moduleName, str methodName) = "checkAndReport(\"<moduleName>\",\"<methodName>\", <methodName>)";
str failTestCall(str moduleName, str methodName) = "checkAndReport(\"<moduleName>\",\"!!! EXCEPTION IN <methodName> !!!\", false)";

loc testReport = outputFile("TestReport.html");

void removeReport() = remove(testReport);


bool checkAndReport(str moduleName, str methodName, bool testResult)
{
  if(false == exists(testReport))
  {
    initializeTestReport();
  }
  addToFile(testReport, testRow(moduleName, methodName, testResult));
  return testResult;
}

test bool showMeARedCell()
{
  return expectEqual(false, true);
}

void initializeTestReport()
{
  resetFile(testReport);
  addToFile(testReport, openTable() + caption("Test results"));
}

void finalizeTestReport()
{
  addToFile(testReport, closeTable());
}