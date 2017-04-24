module utility::Debugging

import DateTime;
import IO;

bool debuggingEnabled = true;

public void debugPrint(&T itemToPrint)
{
  if(debuggingEnabled)
  {
    println(itemToPrint);
  }
}

datetime startDuration() = now();
public void printDuration(datetime startTime) = duration("", startTime);
public void printDuration(str prefix, datetime startTime) = println("<prefix> duration: <createDuration(startTime, now())>");

