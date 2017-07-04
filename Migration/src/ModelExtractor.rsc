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
import utility::StringUtility;

import Decorator;

private bool displayEmptyLines = true;
private bool preProcess = true;

void highLightSources(Tree parseTree) = highLightSources(parseTree, []);
void highLightSources(Tree parseTree, list[str] sourceLines)
{
  
  list[Figure] sourceFigures = [];
  if(true == preProcess)
  {
    debugPrint("Removing unnecessary code");   
    parseTree = removeBoilerPlate(parseTree);    
    debugPrint("Extracting assignments");    
  }
  debugPrint("Starting visit");
  visit(parseTree)
  { 
    case (CodeBlock) `<CompiledInstruction* pre> <WordInstruction logicLines> <CompiledInstruction* post>` :
    {
      debugPrint("Hitted a word instruction");
      insert((CodeBlock) `<CompiledInstruction* pre> <CompiledInstruction* post>` );
    }
  
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
      patternCheck(W);
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
      debugPrint("JumpInstruction");
      sourceFigures += generateLine("Violet", generateSuffix(J, sourceLines));
    }
  }  
  debugPrint("Rendering Figure");
  render(vcat(sourceFigures));  
}

void patternCheck(WordInstruction W)
{
  switch(W)
  {
    // Start of Reset block
    case (WordInstruction) `<SourcePrefix source>12 00000<WhiteSpace ws><NewLine n>`:
    {
      debugPrint("Resetpattern found");
    }
    default:
    {
      debugPrint("Unmatched instruction: <W>");
    }
  }
}

bool isResetPattern(InstructionNumber instruction, WordAddress addressValue)
{
  instructionNumber = parseInt("<instruction>");
  addressNumber = parseInt("<addressValue>");
  
  debugPrint("parsing int <instruction>, <instructionNumber>");
  debugPrint("parsing int <addressValue>, <addressNumber>");
  return 12 == instructionNumber && 0 == addressNumber;
}

Tree extractAssignments(Tree parseTree) = innermost visit(parseTree)
{
  case (CodeBlock) `<CompiledInstruction* pre> <CompiledInstruction* logicLines> <AssignInstruction nextLine> <CompiledInstruction* post>` :
  {
    if(all(logicLine <- logicLines, logicLine is logic))
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

Tree removeBoilerPlate(Tree parseTree)
{
  visitPassed += 1;
  debugPrint("pass <visitPassed>");
  parseTree = innermost visit(parseTree)
  {
    case (CodeBlock) `<CompiledInstruction* pre> <EmptyLine emptyLines> <CompiledInstruction* post>`: 
    {
      debugPrint("Removing empty line block");
      insert(CodeBlock) `<CompiledInstruction* pre> <CompiledInstruction* post>` ;
    }
    case (CodeBlock) `<CompiledInstruction* pre> <SkipInstruction firstNop> <SkipInstruction secondNop> <CompiledInstruction* post>`:
    {
      debugPrint("Removing multiple nop");
      insert((CodeBlock) `<CompiledInstruction* pre> <SkipInstruction firstNop> <CompiledInstruction* post>`);
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

