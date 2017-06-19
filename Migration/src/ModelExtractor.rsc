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
  debugPrint("Removing comments"); 
  treesDiffer = true;
  while(treesDiffer)
  {
    prevTree = parseTree;
    parseTree = removeComments(parseTree);
    treesDiffer = prevTree != parseTree;
  }  
  debugPrint("Starting visit");
  visit(parseTree)
  { 
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
  debugPrint("Rendering Figure");
  render(vcat(sourceFigures));  
}

Tree visitConcrete(Tree parseTree) = visit(parseTree)
{
  case (CodeBlock) `<CompiledInstruction* pre> <CompiledInstruction* patternLines> <CompiledInstruction* followingLine> <CompiledInstruction* post>` :
  {     
    if(!(followingLine is bit) && all(line <- patternLines, line is empty))
    {
      insert (CodeBlock) `<CompiledInstruction* pre> <CompiledInstruction* post>`;
    }     
    else
    {
      fail; // Try again for another match!
    }
  }
};


int visitPassed = 0;

Tree removeComments(Tree parseTree)
{
  visitPassed += 1;
  debugPrint("Starting pass <visitPassed>");
  parseTree = top-down visit(parseTree)
  {
    case (CodeBlock) `<CompiledInstruction* pre> <CompiledInstruction* emptyLines> <CompiledInstruction* post>`: 
    {
      if(all(line <- emptyLines, line is empty))
      {
        debugPrint("Removing empty line block");
        insert(CodeBlock) `<CompiledInstruction* pre> <CompiledInstruction* post>` ;
      } 
      else 
      {
        fail;
      }
    }
  }
  return parseTree;  
}

//Tree removeComments(Tree parseTree) = innermost visit(parseTree)
//{
//  case (CodeBlock) `<CompiledInstruction* pre> <CompiledInstruction* emptyLines> <CompiledInstruction* nonEmptyLine> <CompiledInstruction* post>` 
//  => (CodeBlock) `<CompiledInstruction* pre> <CompiledInstruction* post>` when !(nonEmptyLine is empty) && all(line <- emptyLines, line is empty)
//};

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

