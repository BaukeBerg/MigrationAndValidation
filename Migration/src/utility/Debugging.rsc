module utility::Debugging

import DateTime;
import IO;

public void debugPrint(str textToPrint) = println(textToPrint);
public void printDuration(datetime startTime) = duration("", startTime);
public void printDuration(str prefix, datetime startTime) = println("<prefix> duration: <createDuration(startTime, now())>");

