module ModelExtractor

import FileLocations;
import IO;
import PlcModel;
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
  }
  debugPrint("Trying to extract model data");
  parseTree = extractModel(parseTree);  
  debugPrint("Displaying data without a place in the model");
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
    case LogicInstruction L:
    {
      sourceFigures += generateLine("Tomato", generateSuffix(L, sourceLines));
    }
    case SingleInstruction E:
    {
       sourceFigures += generateLine("SpringGreen", generateSuffix(E, sourceLines));
    }   
    case JumpInstruction J:
    {
      sourceFigures += generateLine("Violet", generateSuffix(J, sourceLines));
    }
    case IOInstruction I:
    {
      sourceFigures += generateLine("Orange", generateSuffix(I, sourceLines));
    }
  }  
  debugPrint("Rendering Figure");
  render(vcat(sourceFigures));  
}


bool patternCheck(WordInstruction W)
{
  switch(W)
  {
    // Start of Reset block
    case (WordInstruction) `<SourcePrefix source>12 00000<WhiteSpace ws><NewLine n>`:
    {
      debugPrint("Resetpattern found");
      return true;
    }
    case (WordInstruction) `<InstructionPrefix prefix><WordAddress W><NewLine n>`:
    {
      debugPrint("Some other AddressMethod");
      return true;       
    }
    default:
    {
      debugPrint("Unmatched instruction: <W>");
      return false;
    }
  }
}

bool singleLine(&T inputData) = 1 == size(inputData);
bool hasContent(&T inputData) = (false == isEmpty(inputData));
bool isEmpty(&T inputData) = (0 == size(inputData));

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


Tree extractModel(Tree tree) = innermost visit(tree)
{  
  /// This syntax fragment extracts assignment of a constant in memory
  case (CodeBlock)`<
  CompiledInstruction* pre><SourcePrefix source>16 00000.1<WhiteSpace ws><NewLine newLine><
  SourcePrefix fetchPrefix>12 <WordAddress constantValue><NewLine newLine2><  
  WordInstruction store><
  CompiledInstruction* post>` :
  {
    addLogicBlock(<"Memory constant", ["<source>16 0000.1","<fetchPrefix>12 <constantValue><newLine2>","<store>"]>);
    insert((CodeBlock)`<CompiledInstruction* pre><CompiledInstruction* post>`);
  }

  // Logic instructions with an equal => Unconditional assign
  case (CodeBlock) `<CompiledInstruction* pre><LogicInstruction logic><CompiledInstruction* between><AssignInstruction assign><CompiledInstruction* post>` :
  {
    if(!any(line <- pre, line is logic) && (isEmpty(between) || (all(line <- between, line is logic))))
    {
      debugPrint("Adding Unconditional assign instruction to model");      
      addLogicBlock(<"Unconditional assign", ["<logic>"] + ["<line>" | line <- between ] + ["<assign>"]>);
      insert((CodeBlock)`<CompiledInstruction* pre><CompiledInstruction* post>`);
    }
    else
    {
      fail;
    }       
  }  
  /// Handle the LSTIO END combinations, and after that, some loose LSTIO instructions...
  case (CodeBlock) `<CompiledInstruction* pre> <IOInstruction lstio> <IOInstruction end> <CompiledInstruction* post>` :
  {
    debugPrint("Adding IO-readout to model");
    addLogicBlock(<"IO-readout", ["<lstio>", "<end>"]>);    
    insert((CodeBlock)`<CompiledInstruction* pre><CompiledInstruction* post>`);
  }
  
  case (CodeBlock) `<CompiledInstruction* pre><IOInstruction lstio><CompiledInstruction* post>` :
  {
    debugPrint("Removing single IO instruction");
    insert((CodeBlock) `<CompiledInstruction* pre><CompiledInstruction* post>`);    
  }
  
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

