module utility::Debugging

import DateTime;
import FileLocations;
import IO;
import List;

import utility::FileUtility;

bool debuggingEnabled = true; 
int printIndex = 0;

public list[str] Errors = [];

bool hasErrors() = 0 < size(Errors);

public void resetErrors()
{
 Errors = [];
}

public &T debugPrint(str infoMessage, &T itemToPrint)
{
  debugPrint("<infoMessage>: <itemToPrint>");
  return itemToPrint;
}

public &T debugPrint(&T itemToPrint, bool printingEnabled)
{
  if(printingEnabled)
  {
    debugPrint(itemToPrint);
  }
  return itemToPrint;
}

public &T debugPrint(&T itemToPrint)
{
  if(debuggingEnabled)
  {
    println("<printIndex> - <itemToPrint>");
    printIndex += 1;
  }
  return itemToPrint;
}

datetime localDateTime = now(); 

public void startDuration() 
{
  debugPrint("Starting duration...");
  localDateTime = now();  
}

public void handleError(str errorToLog)
{
  debugPrint(errorToLog);
  Errors += errorToLog;
  addToFile(generatedFile("rascal.err"), "<errorToLog>\r\n");
}

public void printDuration() = printDuration("", localDateTime);
public void printDuration(str prefix) = printDuration(prefix, localDateTime); 

public void printDuration(datetime startTime) = printDuration("", startTime);
public void printDuration(str prefix, datetime startTime) = println("<prefix> duration: <createDuration(startTime, now())>");

