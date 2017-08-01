module ModelExtractor

import DataTypes;
import EcbHandler;
import FileLocations;
import IO;
import PlcModel;
import Parser;
import ParseTree;
import PC20Syntax;
import PreProcessor;
import String;

import vis::Figure;
import vis::ParseTree;
import vis::Render;

import utility::Debugging;
import utility::InstructionUtility;
import utility::ListUtility;
import utility::StringUtility;

import Decorator;

alias GraphicalBlock = tuple[SourceRange range, Figure graphics];

// Option switches
public bool displayEmptyLines = true;
public bool preProcess = true;
public bool printExtraction = true;
public bool displayExtractedBlocks = true;
public bool extractGenerics = false;

alias ExtractionResult = tuple[list[Statement] statements, CompiledInstruction *syntaxPart];

void highLightSources(Tree parseTree) = highLightSources(parseTree, []);
void highLightSources(Tree parseTree, list[str] sourceLines)
{
  sourceFigures = generateFigures(parseTree, sourceLines);
  debugPrint("Rendering Figure, <size(sourceFigures)>/<size(sourceLines)> lines unallocated.");
  showFigures(sourceFigures);  
}

void showFigures(list[GraphicalBlock] sourceFigures) = render(vcat(sourceFigures.graphics));

list[GraphicalBlock] generateFigures(str fileName) = generateFigures(parseCompiledFile(fileName), readFileLines(compiledFile(fileName)));
list[GraphicalBlock] generateFigures(Tree parseTree, list[str] sourceLines)
{
  sourceFigures = [];
  if(true == preProcess)
  {
    debugPrint("Removing unnecessary code");   
    parseTree = removeBoilerPlate(parseTree);    
    parseTree = preprocess(parseTree);
  }  
  debugPrint("Trying to extract model data");
  //parseTree = extractModelTest(parseTree);  
  debugPrint("Displaying data without a place in the model");
  visit(parseTree)
  { 
    case SkipInstruction S:
    {
      sourceFigures += generateLine("Silver", generateSuffix(S, sourceLines));
    }
  
    case EmptyLine E:
    {
      if(displayEmptyLines)
      {  
        sourceFigures += generateLine("LightGrey", generateSuffix(E, sourceLines));
      }
    }
    case ExtractedCodeBlock ECB:
    {
      debugPrint("Hitted an ECB");
      str colorName = "SandyBrown";
      if(true == displayExtractedBlocks)
      {
        ECB = visit(ECB)
        {
          case ColorName C:
          {
            colorName = substring("<C>", 2, size("<C>")-2);
            insert((ColorName)`++++`);
         }
        }         
        debugPrint("Generating Line"); 
        str EcbStr = replaceAll("<ECB>", "++++", "");
        EcbStr = stringToken(EcbStr, " is ", "");        
        sourceFigures += generateLine(colorName, "<lineInfo(composeSourceRange(ECB))><EcbStr>");
      }       
    }    
    case EventInstruction E:
    {
       sourceFigures += generateLine("OliveDrab", generateSuffix(E, sourceLines));
    }    
    case AssignInstruction A:
    {
      sourceFigures += generateLine("Cyan", generateSuffix(A, sourceLines));
    }
    case StoreInstruction W:
    {
      sourceFigures += generateLine("Lime", generateSuffix(W, sourceLines));
    }
    case CountInstruction B:
    {
      sourceFigures += generateLine("Yellow", generateSuffix(B, sourceLines));      
    }    
    
    case FetchInstruction E:
    {
      sourceFigures += generateLine("Chocolate", generateSuffix(E, sourceLines));
    }
    case CompareInstruction S:
    {
    sourceFigures += generateLine("LightSeaGreen", generateSuffix(S, sourceLines));
    }
    case LogicInstruction L:
    {
      sourceFigures += generateLine("Tomato", generateSuffix(L, sourceLines));
    }
    case CalcInstruction E:
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
    case SingleInstruction S:
    {
      sourceFigures += generateLine("Lightpink", generateSuffix(S, sourceLines));
    }
    
    case Error E:
    {
      handleError("Error in model: <E>");
      sourceFigures += generateLine("White", "Red", "<E>");
    }
  }  
  debugPrint("Visiting done, returning figures");
  return sourceFigures;
}

GraphicalBlock generateLine(str backGround, str content) = generateLine(backGround, "black", content);
GraphicalBlock generateLine(str backGround, str fontColor, str content) = <extractRange(content), generateLineFigure(backGround, fontColor, content)>;

int updateModelRange(int lastProgramCount, SourceRange blockToCheck)
{
  errorPrefix = "Error at <lastProgramCount> with argument <blockToCheck>:" ;
  distance = blockToCheck.firstLine - lastProgramCount;
  if(blockToCheck.firstLine < lastProgramCount)
  {
    handleError("<errorPrefix> Sourcecode counter is decrementing");
  }
  else if(1 != distance)
  {
    handleError("<errorPrefix> Missing <distance-1> source lines");
  }
  else if(blockToCheck.firstLine > blockToCheck.lastLine)    
  {
    handleError("<errorPrefix> Program counter range is decrementing: <blockTocheck>");
  }
  return blockToCheck.lastLine;
}

SourceRange extractRange(str inputSources)
{
  stringTokens = split(":", inputSources);
  integers = extractIntegers(head(stringTokens));
  programCounterAmount = size(integers);
  switch(programCounterAmount)
  {
    case 1:
    {
      return <integers[0], integers[0]>;
    }
    case 2:
    {
      return <integers[0], integers[1]>;
    }  
    default:
    {
      handleError("Invalid amount of integers received: <programCounterAmount> in <inputSources>");
      return <-1, -1>;
    }      
  }  
}  
 
str lineInfo(SourceRange range) = "<range.firstLine>-<range.lastLine>: ";
 
bool singleLine(&T inputData) = 1 == size(inputData);
bool hasContent(&T inputData) = (false == isEmpty(inputData));
bool isEmpty(&T inputData) = (0 == size(inputData));

int size(str inputData) = String::size(inputData);

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
    case (CodeBlock) `<CompiledInstruction* pre> <EmptyLine emptyLine> <CompiledInstruction* post>`: 
    {
      emptyLines = [trim("<emptyLine>")];
      while((CodeBlock)`<EmptyLine emptyLine><CompiledInstruction *newPost>` := (CodeBlock)`<CompiledInstruction* post>`)
      {
        post = newPost;
        emptyLines += [trim("<emptyLine>")];
      }
      debugPrint("Removing <size(emptyLines)> empty line(s): <joinList(emptyLines, ", ")>");
      insert(CodeBlock) `<CompiledInstruction* pre> <CompiledInstruction* post>` ;     
    }   
  }
  return parseTree;  
}

ExtractionResult extractConditions(list[Statement] conditions, CompiledInstruction *post)
{
  statements = conditions;
  while((CodeBlock)`<ConditionInstruction newC><CompiledInstruction* newPost>` := (CodeBlock)`<CompiledInstruction *post>`)
  {
    statements += ["<newC>"];
    post = newPost;
  }
  return <statements, post>;
}

ExtractionResult extractConditions(CompiledInstruction *pre) = extractConditions(pre, []);
ExtractionResult extractConditions(CompiledInstruction *pre, ConditionInstruction condition) = extractConditions(pre, ["<condition>"]);
ExtractionResult extractConditions(CompiledInstruction *pre, list[Statement] conditions)
{
  statements = conditions;
  while((CodeBlock)`<CompiledInstruction* newPre><
                    ConditionInstruction newC>`
                    := (CodeBlock)`<CompiledInstruction *pre>`)
  {
    debugPrint("extra condition: <newC>");
    statements = ["<newC>"] + statements;
    pre = newPre;
  }                    
  return <statements, pre>;
}

ExtractionResult extractActions(CompiledInstruction *post) = extractActions([], post);
ExtractionResult extractActions(ExecuteInstruction execute, CompiledInstruction *post) = extractActions(["<execute>"], post);
ExtractionResult extractActions(list[Statement] actions, CompiledInstruction *post)
{
  while((CodeBlock)`<ExecuteInstruction execute><
                    CompiledInstruction *newPost>`
                    := (CodeBlock)`<CompiledInstruction *post>`)
  {
    post = newPost;
    actions += ["<execute>"]; 
  }  
  return <actions, post>;
}

void constructLogic(str description, list[Statement] statements)
{
  debugPrint("Constructing logic for <description>: <size(statements)>.");
  first = getProgramCounter(head(statements));
  last = getProgramCounter(head(reverse(statements)));
  blockType = description;
}

void handleBlock(str description, CompiledInstruction *pre, CompiledInstruction *post)
{
  constructLogic(description);
  insert(composeBlock(pre,post));  
}

void constructLogic(str description)
{
  eventDescription = "logic for <description>: <size(conditions)> conditions, <size(actions)> actions.";
  debugPrint("Constructing <eventDescription>");
  try
  {
    first = getProgramCounter(head(conditions));
    last = getProgramCounter(head(reverse(actions)));
    blockType = description;
    addLogicBlock(<first, last, description, conditions, actions>);
  }
  catch:
  {
    handleError("Unable to construct <eventDescription>: conditions: <joinList(conditions)>, actions: <joinList(actions)>");
  }  
}

CodeBlock composeBlock(CompiledInstruction* pre, CompiledInstruction* post)
{
  codeBlock = "";
  firstLine = right("<first>", 5, "0");
  lastLine = right("<last>", 5, "0");
  try
  {  
    strFirst = parse(#FiveDigits, firstLine);
    strLast = parse(#FiveDigits, lastLine);
    description = parse(#Description, blockType);
    codeBlock = (ExtractedCodeBlock)`++++CodeBlock: <FiveDigits strFirst>-<FiveDigits strLast> is <Description description>`;
    return (CodeBlock)`<CompiledInstruction* pre><ExtractedCodeBlock codeBlock><CompiledInstruction* post>`;
  }
  catch:
  {
    if(!isCorrect(firstLine, #FiveDigits))
    {
      handleError("Unable to parse first line as FiveDigits: <firstLine>"); 
    }
    if(!isCorrect(lastLine, #FiveDigits))
    {
      handleError("Unable to parse last line as FiveDigits: <lastLine>"); 
    }
    if(!isCorrect(blockType, #Description))
    {
      handleError("Unable to parse description as description: <blockType>");
    }    
  }
  return (CodeBlock)`<CompiledInstruction* pre><CompiledInstruction* post>`;
}

str generateSuffix(&T item, list[str] sourceLines) = "<getProgramCounter("<item>")>: <lineContent(sourceLines, getLineNumber(item))>";

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
