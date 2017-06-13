module ModelExtractor

import FileLocations;
import IO;
import Parser;
import ParseTree;
import PC20Syntax;
import Stripper;

import vis::Figure;
import vis::ParseTree;
import vis::Render;

import utility::ListUtility;

import Decorator;

private bool displayEmptyLines = true;

void highLightSources(Tree parseTree) = highLightSources(parseTree, []);
void highLightSources(Tree parseTree, list[str] sourceLines)
{
  list[Figure] sourceFigures = [];  
  visit(parseTree)
  {
    case EmptyLine E:
    {
      if(displayEmptyLines)
      {  
        sourceFigures += generateLine("White", generateSuffix(E, sourceLines));
      }
    }
    case BitInstruction B:
    {
      sourceFigures += generateLine("Yellow", generateSuffix(B, sourceLines));      
    }
    case WordInstruction W:
    {
      sourceFigures += generateLine("Blue", generateSuffix(W, sourceLines));
    }
    case SingleInstruction E:
    {
       sourceFigures += generateLine("Green", generateSuffix(E, sourceLines));
    }    
  }
  render(vcat(sourceFigures));  
}

str generateSuffix(&T item, list[str] sourceLines) = "<getLineNumber(item)>: <lineContent(sourceLines, getLineNumber(item))>";

str lineContent(list[str] sourceLines, int lineNumber)
{
  try
  {
    return sourceLines[lineNumber-1];
  }
  catch:
  {
    return "-- Empty --";
  }
}

int getLineNumber(&T item) = item@\loc.begin.line;

