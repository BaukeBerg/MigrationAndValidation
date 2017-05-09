module utility::TestUtility

import IO;
import List;
import String;

import utility::ListUtility;

bool expectFalse(bool testMe) = expectEqual(false, testMe);
bool expectTrue(bool testMe) = expectEqual(true, testMe);

bool expectEqual(list[str] expected, list[str] actual, loc fileToStore)
{
  bool result = expectEqual(expected, actual);
  writeFile(fileToStore, joinList(actual));
  return result;
}

bool expectEqual(&T expected, &T actual, loc fileToStore)
{
  bool result = expectEqual(expected, actual);
  writeFile(fileToStore, actual);
  return result;
}

bool expectEqual(list[str] expected, list[str] actual, str messageOnFailure)
{
  if(!expectEqual(size(expected), size(actual)))
  {
    return false;
  }
  
  for(n <- [0.. size(actual)], !expectEqual(expected[n], actual[n]))
  {
    return false;
  }
  return true;
}

bool expectEqual(str expected, str actual)
{
  if(expected != actual)
  {
    iprintln("Expected: --|<expected>|-- size: <size(expected)>, received --|<actual>|-- size: <size(actual)>");
    return false;
  }
  return true;
}

// Prints the resuls when they are not expected, faster debugging of tests
bool expectEqual(&T expected, &T actual) = expectEqual(expected, actual, "");
bool expectEqual(&T expected, &T actual, str messageOnFailure)
{
  if(expected != actual)
  {
    iprintln("Expected: <expected>");
    iprintln("Received: <actual>");
    iprintln(messageOnFailure);            
    return false;
  }
  return true;
}

bool expectNotEqual(&T expected, &T actual) = expectNotEqual(expected, actual, "");
bool expectNotEqual(&T expected, &T actual, str messageOnFailure)
{
  if(expected == actual)
  {
    iprintln("Equal values passed: <expected>!");
    iprintln(messageOnFailure);  
    return false;
  }
  return true;
}

bool expectEqualFiles(loc expectedFile, loc actualFile) = expectEqualFiles(expectedFile, readFileLines(actualFile));
bool expectEqualFiles(loc fileToScan, list[str] contentToCompare) = expectEqualFiles(readFileLines(fileToScan), contentToCompare);
bool expectEqualFiles(list[str] fileToScan, list[str] contentToCompare)
{
  if(false == expectEqual(fileToScan, contentToCompare))
  {
    addToFile(outputFile("test/FailedFileCompares.txt"), joinList(contentToCompare));
    return false;
  }
  return true;
}