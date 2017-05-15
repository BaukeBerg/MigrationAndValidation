module LabelHandler

import FileLocations;
import IO;
import List;
import Parser;
import PC20Syntax;
import String;

import utility::Debugging;
import utility::ListUtility;
import utility::FileUtility;

alias LabelList = list[LabelDeclaration];
alias LabelDeclaration = tuple[str label, str lineNumber];

private bool showLabelHandlerOutput = true ;

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
  labelString = extractLabelString(fileLocation);
  debugPrint("labelString = <labelString>", showLabelHandlerOutput);
  visit(parseText(labelString, #start[LabelList]))
  {
    case ComposedLabel C:
    {
      debugPrint("Found label <C>", showLabelHandlerOutput);
      labels += [extractLabel(C)];      
    }
  }
  return sort(labels);
} 

LabelDeclaration composeLabel(str label, int progLine)
{
  return <label, "<progLine>">;  
}

LabelDeclaration extractLabel(ComposedLabel C)
{
  LabelDeclaration l = <"","">;
  visit(C)
  {
    case Label C:
      l.label = "<C>";
    case LineNumber C:
      l.lineNumber = "<C>";
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

str getProgramLine(LabelList labels, str labelToFind)
{
  for(label <- labels, label.label == labelToFind)
  {
    return label.lineNumber;
  }
  return "-1";  
}

