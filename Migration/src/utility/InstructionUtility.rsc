module utility::InstructionUtility

// Simple utility to extract information from (compiled) instructions

import List;
import ParseTree;
import String;

import utility::StringUtility;

str addressRange(list[str] statements) = "<getAddress(head(statements))>-<getAddress(head(reverse(statements)))>";

str getAddress(str lineToCheck)
{
  try
  {
    return substring(lineToCheck, 15,20);
  }
  catch:
  {
    return "00000";
  }
}

int getProgramCounter(str lineToCheck)
{
  try
  {
    return parseInt(substring(lineToCheck, 6,11));
  }
  catch:
  {
    return -1;
  }  
}

int getLineNumber(&T item)
{
  try
  {
    return item@\loc.begin.line;
  }
  catch:
  {
    return -1 ;
  }
}
