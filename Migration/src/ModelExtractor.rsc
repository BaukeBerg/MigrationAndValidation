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

Tree removeComments(Tree parseTree) = innermost visit(parseTree)
{
  case (CodeBlock) `<CompiledInstruction* pre> <CompiledInstruction* lines> <CompiledInstruction* post>` :
  {     
    if(all(b <- lines, b is empty))
    {
      insert (CodeBlock) `<CompiledInstruction* pre> <CompiledInstruction* post>`;
    }     
    else
    {
      fail; // Try again for another match!
    }
  }
};

Tree visitConcrete(Tree parseTree) = innermost visit(parseTree)
{
  case (CodeBlock) `<CompiledInstruction* pre> <CompiledInstruction* bits> <CompiledInstruction* post>` 
  => (CodeBlock) `<CompiledInstruction* pre>  <CompiledInstruction* post>` when all(b <- bits, b is bit)
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

