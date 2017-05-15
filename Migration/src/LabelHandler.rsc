module LabelHandler

import FileLocations;
import IO;
import List;
import Parser;
import PC20Syntax;
import String;

import utility::ListUtility;
import utility::FileUtility;

alias LabelList = list[LabelDeclaration];
alias LabelDeclaration = tuple[str label, str lineNumber];

void writeToFile(loc fileToWrite, LabelList listToStore)
{
  formattedList = ["Number of errors: 0"]; // @TODO perhaps change this to a more elegant solution
  for(declaration <- listToStore)
  {
    formattedList += "<declaration.label>:<declaration.lineNumber>";    
  }
  writeToFile(fileToWrite, formattedList);
}

LabelList extractLabelList(str fileName) = extractLabelList(testFile(fileName));
LabelList extractLabelList(loc fileLocation)
{
  LabelList labels = [];
  visit(parseText(extractLabelString(fileLocation), #start[LabelList]))
  {
    case LabelLocation L:
    {
      labels += [extractLabel(L)];      
    }
  }
  return tail(sort(labels));
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

str extractLabelString(loc fileLocation)
{
  startFound = false ;
  symbolLines = [];
  for(line <- readFileLines(fileLocation))
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
