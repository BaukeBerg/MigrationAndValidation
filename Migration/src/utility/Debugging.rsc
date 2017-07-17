module utility::Debugging

import DateTime;
import FileLocations;
import IO;

import utility::FileUtility;

bool debuggingEnabled = true; 


public void debugPrint(&T itemToPrint, bool printingEnabled)
{
  if(printingEnabled)
  {
    debugPrint(itemToPrint);
  }
}

public void debugPrint(&T itemToPrint)
{
  if(debuggingEnabled)
  {
    println(itemToPrint);
  }
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
  addToFile(generatedFile("rascal.err"), "<errorToLog>\r\n");
}

public void printDuration() = printDuration("", localDateTime);
public void printDuration(str prefix) = printDuration(prefix, localDateTime); 

public void printDuration(datetime startTime) = printDuration("", startTime);
public void printDuration(str prefix, datetime startTime) = println("<prefix> duration: <createDuration(startTime, now())>");

