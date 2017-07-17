module ModelExtractor

import FileLocations;
import IO;
import PlcModel;
import Parser;
import ParseTree;
import PC20Syntax;
import String;

import vis::Figure;
import vis::ParseTree;
import vis::Render;

import utility::Debugging;
import utility::ListUtility;
import utility::StringUtility;

import Decorator;

private bool displayEmptyLines = true;
private bool preProcess = true;

alias ExtractionResult = tuple[list[Statement] statements, CompiledInstruction *syntaxPart];

void highLightSources(Tree parseTree) = highLightSources(parseTree, []);
void highLightSources(Tree parseTree, list[str] sourceLines)
{
  list[Figure] sourceFigures = generateFigures(parseTree, sourceLines);
  debugPrint("Rendering Figure, <size(sourceFigures)>/<size(sourceLines)> lines unallocated.");
  render(vcat(sourceFigures));
}

list[Figure] generateFigures(str fileName) = generateFigures(parseCompiledFile(fileName), readFileLines(compiledFile(fileName)));
list[Figure] generateFigures(Tree parseTree, list[str] sourceLines)
{
  list[Figure] sourceFigures = [];
  if(true == preProcess)
  {
    debugPrint("Removing unnecessary code");   
    parseTree = removeBoilerPlate(parseTree);
  }
  debugPrint("Trying to extract model data");
  parseTree = extractModelTest(parseTree);  
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
      sourceFigures += generateLine("Sandybrown", "<lineInfo(ECB)><ECB>"); 
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
  }  
  return sourceFigures;
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
    case (CodeBlock) `<CompiledInstruction* pre> <EmptyLine emptyLine> <CompiledInstruction* post>`: 
    {
      debugPrint("Removing empty line block");
      while((CodeBlock)`<EmptyLine E><CompiledInstruction *newPost>` := (CodeBlock)`<CompiledInstruction* post>`)
      {
        post = newPost;
      }
      insert(CodeBlock) `<CompiledInstruction* pre> <CompiledInstruction* post>` ;     
    }
    case (CodeBlock) `<CompiledInstruction* pre> <SkipInstruction firstNop> <SkipInstruction secondNop> <CompiledInstruction* post>`:
    {
      debugPrint("Removing multiple nop");
      while((CodeBlock)`<SkipInstruction moreNop><CompiledInstruction* newPost>` := (CodeBlock)`<CompiledInstruction post>`)
      {
        post = newPost;
      }
      insert((CodeBlock) `<CompiledInstruction* pre> <SkipInstruction firstNop> <CompiledInstruction* post>`);
    }    
    case (CodeBlock) `<
    CompiledInstruction* pre> <ConditionInstruction condition> <SkipInstruction Nop> <CompiledInstruction* post>`:
    {
      original = size(pre)+size(post)+2;
      debugPrint("Found an empty exection <original>");      
      while((CodeBlock)`<
            CompiledInstruction* newPre><
            ConditionInstruction newC>` 
            := (CodeBlock)`<CompiledInstruction *pre>`)
            { 
              pre = newPre;
            }
      debugPrint("Removed <original-size(pre)-size(post)> lines");
      insert((CodeBlock) `<CompiledInstruction* pre> <CompiledInstruction* post>`);
    } 
  }
  return parseTree;  
}

list[Statement] actions = [];
list[Statement] conditions = [];
int first = 0;
int last = 0;
str nl = "\n";
str blockType;

Tree extractModelTest(Tree tree) = innermost visit(tree)
{
  case (CodeBlock) `<CompiledInstruction* pre><
    JumpInstruction J><CompiledInstruction* post>`:
  {
    while((CodeBlock)`<CompiledInstruction *newPre><
      ConditionInstruction newP>` 
    := (CodeBlock)`<CompiledInstruction* pre>`)
    {
      debugPrint("Extracting action: <newP>");
      pre = newPre;
    }    
    insert((CodeBlock)`<CompiledInstruction* pre><CompiledInstruction* post>`); 
  } 
     
  case (CodeBlock) `<CompiledInstruction* pre><
    EventInstruction C><
    CompiledInstruction* post>`:
  {
    debugPrint("Found an event");
    actions = [];
    conditions = ["<C>"];
    debugPrint("Let\'s examine all previous conditions");
    while((CodeBlock)`<CompiledInstruction* newPre><
                       ConditionInstruction newC>` 
      := (CodeBlock)`<CompiledInstruction *pre>`)
    {
      conditions = ["<newC>"] + conditions;
      pre = newPre;
    }
    debugPrint("Let\'s example all following conditions");
    while((CodeBlock)`<ConditionInstruction newC><CompiledInstruction* newPost>` := (CodeBlock)`<CompiledInstruction *post>`)
    {
      conditions += ["<newC>"];
      post = newPost;
    }
    debugPrint("Now harvest all actions");
    while((CodeBlock)`<ExecuteInstruction newA><CompiledInstruction* newPost>` := (CodeBlock)`<CompiledInstruction *post>`)
    {
      post = newPost;
      actions += ["<newA>"];
    }
    debugPrint("Finally, store model block and insert remainder");
    handleBlock("Event", pre, post);
  }
  
  case (CodeBlock)`<
  CompiledInstruction* pre><
  ConditionInstruction C><
  AssignInstruction A><
  CompiledInstruction* post>`:
  {
    conditions = ["<C>"];
    actions = ["<A>"];    
    while((CodeBlock)`<AssignInstruction newA><
                      CompiledInstruction* newPost>` := (CodeBlock)`<CompiledInstruction *post>`)
                      { 
                        post = newPost;
                        actions += ["<newA>"];
                      }
   
    while((CodeBlock)`<CompiledInstruction *newPre><
                   ConditionInstruction newC>` := (CodeBlock)`<CompiledInstruction *pre>`)
    {
      debugPrint("previous pre size: <size(pre)>");
      pre = newPre;
      conditions = ["<newC>"] + conditions;      
    }
    handleBlock("Assign Statement", pre, post);    
  }

  /// FullStore
  case (CodeBlock)`<
  CompiledInstruction* pre><  
  SourcePrefix p1>13 <WordAddress w1><NewLine nl1><
  SourcePrefix p2>13 <WordAddress w2><NewLine nl2><
  SourcePrefix p3>13 <WordAddress w3><NewLine nl3><
  SourcePrefix p4>13 <WordAddress w4><NewLine nl4><
  SourcePrefix p5>14 <WordAddress w5><NewLine nl5><
  SourcePrefix p6>14 <WordAddress w6><NewLine nl6><
  SourcePrefix p7>14 <WordAddress w7><NewLine nl7><
  SourcePrefix p8>14 <WordAddress w8><NewLine nl8><
  CompiledInstruction* post>`:
  {
    conditions = [];
    while((CodeBlock)`<CompiledInstruction* newPre><
                      ConditionInstruction newC>`
                      :=
                      (CodeBlock)`<CompiledInstruction* pre>`)
    {
      pre = newPre;
      conditions = ["<newC>"] + conditions; 
    }
    actions = ["<p1>13 <w1>", "<p2>13 <w2>", "<p3>13 <w3>", "<p4>13 <w4>", "<p5>14 <w5>", "<p6>14 <w6>", "<p7>14 <w7>", "<p8>14 <w8>"] ;
    debugPrint("Adding 4-address FetchAndStore");
  	handleBlock("4-address Fetch and Store", pre, post);  	
  }

  /// This syntax fragment extracts assignment of a constant in memory
  case (CodeBlock)`<
  CompiledInstruction* pre><SourcePrefix source>16 00000.1<WhiteSpace ws><NewLine newLine><
  SourcePrefix fetchPrefix>12 <WordAddress constantValue><NewLine newLine2><  
  StoreInstruction store><
  CompiledInstruction* post>` :
  {
    if((CodeBlock)`<CompiledInstruction newPre><
                   ConditionInstruction newC>`
                   := (CodeBlock)`<ConditionInstruction pre>`)
    {
      fail; // Only unconditional AND 0.1' s are matched. No preconditions
    }
    first = parseInt("<source>");
    last = parseInt("<store>");
    Conditions = ["<source>16 00000.1<ws>"];
    Actions = ["<fetchPrefix>12 <constantValue><newLine2>", "<store>"];
    handleBlock("Memory Constant", pre, post);    
  }

  /// This syntax fragment extracts pulses from the sources
  case (CodeBlock)`<
  CompiledInstruction* pre><SourcePrefix source>16 00001<BitValue bitVal><WhiteSpace ws><NewLine newLine><
  SourcePrefix fetchPrefix>01 <BitAddress pulseSource><NewLine newLine2><  
  AssignInstruction pulseTarget><
  CompiledInstruction* post>` :
  {
    handleBlock(<"Timer Pulse", ["<source>16 00001<bitVal>","<fetchPrefix>01 <pulseSource><newLine2>","<pulseTarget>"]>, pre, post);    
  }

  /// Handle the LSTIO END combinations, and after that, some loose LSTIO instructions...
  case (CodeBlock) `<CompiledInstruction* pre> <IOInstruction lstio> <IOInstruction end> <CompiledInstruction* post>` :
  {
    debugPrint("Adding IO-readout to model");
    //debugPrint("Size of pre: <size(pre)>");
    //result = ExtractConditions(pre);
    //conditions = result.statements;
    //pre = result.syntaxPart;    
    //debugPrint("Size of pre: <size(pre)>");
    //actions = ["<lstio>", "<end>"];    
    //  
    insert(composeBlock(pre, post));
  }
  
  case (CodeBlock) `<CompiledInstruction* pre><IOInstruction lstio><CompiledInstruction* post>` :
  {
    debugPrint("Removing single lstIO instruction");
    insert((CodeBlock) `<CompiledInstruction* pre><CompiledInstruction* post>`);    
  }
  
  // If all else fails, this is just an ordinary If Something => Do Something construction
  // Logic instructions with an equal => Unconditional assign
  case (CodeBlock) `<CompiledInstruction* pre><ConditionInstruction condition><ExecuteInstruction execute><CompiledInstruction* post>` :
  {
    debugPrint("Adding an generic if then ... block");
    <conditions, pre> = extractConditions(pre, condition);
    <actions, post> = extractActions(execute, post);
    handleBlock("Generic action block", pre, post);    
  }  
    
};

ExtractionResult extractConditions(CompiledInstruction *pre) = extractConditions(pre, []);
ExtractionResult extractConditions(CompiledInstruction *pre, ConditionInstruction condition) = extractConditions(pre, ["<condition>"]);
ExtractionResult extractConditions(CompiledInstruction *pre, list[Statement] conditions)
{
  statements = conditions;
  while((CodeBlock)`<CompiledInstruction* newPre><
                    ConditionInstruction newC>`
                    := (CodeBlock)`<CompiledInstruction *pre>`)
  {
    debugPrint("extra statement <newC>");
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

void handleBlock(str description, CompiledInstruction *pre, CompiledInstruction *post)
{
  constructLogic(description);
  insert(composeBlock(pre,post));  
}

void constructLogic(str description)
{
  first = getProgramCounter(head(conditions));
  last = getProgramCounter(head(reverse(actions)));
  blockType = description;
  addLogicBlock(<first, last, description, conditions, actions>); 
}

CodeBlock composeBlock(CompiledInstruction* pre, CompiledInstruction* post)
{
  codeBlock = "";
  try
  {  
    strFirst = parse(#FiveDigits, right("<first>", 5, "0"));
    strLast = parse(#FiveDigits, right("<last>", 5, "0"));
    description = parse(#Description, blockType);
    codeBlock = (ExtractedCodeBlock)`CodeBlock: <FiveDigits strFirst>-<FiveDigits strLast> is <Description description>`;
    return (CodeBlock)`<CompiledInstruction* pre><ExtractedCodeBlock codeBlock><CompiledInstruction* post>`;
  }
  catch:
  {
    debugPrint("parsing failure...");
  }
  return (CodeBlock)`<CompiledInstruction* pre><CompiledInstruction* post>`;
}

str generateSuffix(ExtractedCodeBlock Block, list[str] sourceLines) = "<Block>: <Block>";

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

int getProgramCounter(str lineToCheck)
{
  try
  {
    return parseInt(substring(lineToCheck, 6,11));
  }
  catch:
  {
    return -1;
  }  
}

str lineInfo(ExtractedCodeBlock ECB)
{
  items = split("-", "<ECB>");
  if(2 <= size(items))
  {
    return "<parseInt(items[0])>-<parseInt(items[1])>: ";
  }
  return "ERROR: <ECB>: ";
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

