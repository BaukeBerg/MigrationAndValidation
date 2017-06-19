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

import utility::Debugging;
import utility::ListUtility;

import Decorator;

private bool displayEmptyLines = true;

void highLightSources(Tree parseTree) = highLightSources(parseTree, []);
void highLightSources(Tree parseTree, list[str] sourceLines)
{
  list[Figure] sourceFigures = []; 
  debugPrint("Starting visit"); 
  visit(visitConcrete(removeComments(parseTree)))  {
    case EmptyLine E:
    {
      if(displayEmptyLines)
      {  
        sourceFigures += generateLine("LightGrey", generateSuffix(E, sourceLines));
      }
    }
    case BitInstruction B:
    {
      sourceFigures += generateLine("Yellow", generateSuffix(B, sourceLines));      
    }
    case WordInstruction W:
    {
      sourceFigures += generateLine("Cyan", generateSuffix(W, sourceLines));
    }
    case SingleInstruction E:
    {
       sourceFigures += generateLine("SpringGreen", generateSuffix(E, sourceLines));
    }   
  }  
  render(vcat(sourceFigures));  
}

Tree visitConcrete(Tree parseTree) = innermost visit(parseTree)
{
  case (CodeBlock) `<CompiledInstruction* pre> <CompiledInstruction* patternLines> <CompiledInstruction* followingLine> <CompiledInstruction* post>` :
  {     
    if(!(followingLine is bit) && all(line <- patternLines, line is bit))
    {
      insert (CodeBlock) `<CompiledInstruction* pre> <CompiledInstruction* post>`;
    }     
    else
    {
      fail; // Try again for another match!
    }
  }
};

Tree removeComments(Tree parseTree) = visit(parseTree)
{
  case (CodeBlock) `<CompiledInstruction* pre> <CompiledInstruction* line> <CompiledInstruction* post>` 
  => (CodeBlock) `<CompiledInstruction* pre>  <CompiledInstruction* post>` when line is empty
};

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

