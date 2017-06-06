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

void highLightSources(Tree parseTree) = highLightSources(parseTree, []);
void highLightSources(Tree parseTree, list[str] sourceLines)
{
  list[Figure] sourceFigures = [];
  visit(parseTree)
  {
    case EmptyLine E:
      sourceFigures += generateLine("White","<getLineNumber(E)>: <lineContent(sourceLines, getLineNumber(E))>");
  }
  render(vcat(sourceFigures));  
}

str lineContent(list[str] sourceLines, int lineNumber)
{
  try
  {
    return sourceLines[lineNumber];
  }
  catch:
  {
    return "-- Empty --";
  }
}

int getLineNumber(&T item) = item@\loc.begin.line;

