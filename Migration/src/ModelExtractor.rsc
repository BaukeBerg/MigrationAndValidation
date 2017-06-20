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
private bool preProcess = true;

void highLightSources(Tree parseTree) = highLightSources(parseTree, []);
void highLightSources(Tree parseTree, list[str] sourceLines)
{
  
  list[Figure] sourceFigures = [];
  if(true == preProcess)
  {
    debugPrint("Removing comments");   
    parseTree = removeComments(parseTree);
    debugPrint("Extracting assignments");
    parseTree = extractAssignments(parseTree);
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
    case AssignInstruction A:
    {
      sourceFigures += generateLine("Cyan", generateSuffix(A, sourceLines));
    }
    case WordInstruction W:
    {
      sourceFigures += generateLine("Lime", generateSuffix(W, sourceLines));
    }
    case BitInstruction B:
    {
      sourceFigures += generateLine("Yellow", generateSuffix(B, sourceLines));      
    }    
    case EventInstruction E:
    {
      sourceFigures += generateLine("Chocolate", generateSuffix(E, sourceLines));
    }
    case SkipInstruction S:
    {
    sourceFigures += generateLine("Silver", generateSuffix(S, sourceLines));
    }
    case ReadInstruction R:
    {
      sourceFigures += generateLine("Tomato", generateSuffix(R, sourceLines));
    }
    case SingleInstruction E:
    {
       sourceFigures += generateLine("SpringGreen", generateSuffix(E, sourceLines));
    }   
    case JumpInstruction J:
    {
      sourceFigures += generateLine("Violet", generateSuffix(J, sourceLines));
    }
  }  
  debugPrint("Rendering Figure");
  render(vcat(sourceFigures));  
}

Tree extractAssignments(Tree parseTree) = innermost visit(parseTree)
{
  case (CodeBlock) `<CompiledInstruction* pre> <CompiledInstruction* logicLines> <CompiledInstruction* nextLine> <CompiledInstruction* post>` :
  {
    if(hasContent(logicLines) && singleLine(nextLine) && all(logicLine <- logicLines, logicLine is logic))
    {
      if(size(logicLines) > 1) 
      {
        debugPrint("Pre size: <size(pre)>");
        debugPrint("Logic line size: <size(logicLines)>");
        debugPrint("NextLine size: <size(nextLine)>");
        debugPrint("Post size: <size(post)>");
      }
      if(hasContent(pre) && hasContent(post))
      {
        insert (CodeBlock)`<CompiledInstruction* pre> <CompiledInstruction *nextLine> <CompiledInstruction* post>` ;
      }
      else if(hasContent(post))
      {
        insert (CodeBlock)`<CompiledInstruction* nextLine> <CompiledInstruction* post>`;
      }
      else if(hasContent(pre))
      {
        insert (CodeBlock)`<CompiledInstruction* pre> <CompiledInstruction* nextLine>`;
      }
      else
      {
        insert (CodeBlock)`<CompiledInstruction* nextLine>`;
      }
           
    }
    else
    {
      fail;
    }
  }
};

bool singleLine(&T inputData) = 1 == size(inputData);
bool hasContent(&T inputData) = 0 < size(inputData);

int size(&T inputData)
{
  bitsSize = 0;
  for(b <- inputData)
  {
    bitsSize += 1;
  }
  return bitsSize;
} 

int visitPassed = 0;

Tree removeComments(Tree parseTree)
{
  visitPassed += 1;
  debugPrint("Starting pass <visitPassed>");
  parseTree = innermost visit(parseTree)
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

