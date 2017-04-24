module LabelHandler

import FileLocations;
import IO;
import Parser;
import PC20Syntax;
import String;

import utility::ListUtility;

alias LabelList = list[LabelDeclaration];
alias LabelDeclaration = tuple[str label, str lineNumber];
LabelList extractLabelList(str fileName)
{
  LabelList labels = [];
  visit(parseText(extractLabelString(fileName), #start[LabelList]))
  {
    case LabelLocation L:
    {
      labels += [extractLabel(L)];      
    }
  }
  return labels;
} 

LabelDeclaration composeLabel(str label, int progLine)
{
  return <label, "<progLine>">;  
}

LabelDeclaration extractLabel(LabelLocation L)
{
  LabelDeclaration l = <"","">;
  visit(L)
  {
    case Label L:
      l.label = "<L>";
    case LineNumber L:
      l.lineNumber = "<L>";
  }      
  return l;
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