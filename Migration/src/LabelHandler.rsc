module LabelHandler

import FileLocations;
import IO;
import Parser;
import PC20Syntax;
import String;

import utility::ListUtility;

alias LabelList = map[str label, str lineNumber];

LabelList extractLabelList(str fileName)
{
  LabelList labels = ();
  visit(parseText(extractLabelString(fileName), #start[LabelList]))
  {
    case LabelLocation L:
    {
      str Label = "";
      str Line = "";
      visit(L)
      {
        case Label L:
          Label = "<L>";
        case LineNumber L:
          Line = "<L>";
      }      
      labels[Label] = Line;
    }
  }
  return labels;
} 

str extractLabelString(str fileName)
{
  startFound = false ;
  symbolLines = [];
  for(line <- readFileLines(testFile(fileName)))
  {
    if(startFound)
    {
      symbolLines += line;
    } 
    if(contains(line, "Number of errors: 0"))
    {
      startFound = true;
    }
  }
  return replaceAll(joinList(trimList(symbolLines)), " ", "");
}