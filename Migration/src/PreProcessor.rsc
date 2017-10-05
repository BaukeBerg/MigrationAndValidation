module PreProcessor

import DataTypes;
import EcbHandler;
import ParseTree;
import PC20Syntax;
import String;

import utility::Debugging;
import utility::InstructionUtility;
import utility::StringUtility;

Tree preprocess(Tree tree) = innermost visit(tree)
{
  /// NopBlock
  case (CodeBlock) `<CompiledInstruction* pre> <SkipInstruction firstNop> <CompiledInstruction* post>`:
  {
    firstInstruction = lastInstruction = firstNop;
    while((CodeBlock)`<SkipInstruction lastNop><CompiledInstruction* newPost>` := (CodeBlock)`<CompiledInstruction post>`)
    {
      lastInstruction = lastNop;
      post = newPost;
    }
    nopBlock = composeNopBlock(composeSourceRange(firstInstruction, lastInstruction));
    insert(CodeBlock)`<CompiledInstruction* pre><NopBlock nopBlock><CompiledInstruction* post>`;    
  } 
  /// Fetch
  case (CodeBlock)`<CompiledInstruction* pre> <FetchInstruction fetch> <CompiledInstruction *post>`:
  {
    statements = ["<fetch>"];
    while((CodeBlock)`<FetchInstruction fetch><CompiledInstruction *newPost>`
      := (CodeBlock)`<CompiledInstruction *post>`) // => 'Code ... post> => Can be changed to just 'post' 
    {
      post = newPost;
      statements += ["<fetch>"];
    }      
    readValue = composeReadValue(statements);
    insert (CodeBlock)`<CompiledInstruction* pre><ReadValue readValue><CompiledInstruction *post>`;
  }
 
  /// FetchConstant
  case (CodeBlock)`<CompiledInstruction* pre> <FetchConstantInstruction fetch> <WriteValue store> <CompiledInstruction *post>`:
  {
    try
    {
      assignConstant = composeAssignConstant(fetch, store);
      insert(CodeBlock)`<CompiledInstruction* pre><AssignConstant assignConstant><CompiledInstruction* post>`;
    }
    catch:
    {
      handleError("failed to compose <fetch> <store>");
      fail;
    }    
  }
    
  /// Store
  case (CodeBlock)`<CompiledInstruction* pre> <StoreValue store> <CompiledInstruction *post>`:
  {
    statements = ["<store>"];
    while((CodeBlock)`<StoreValue store><CompiledInstruction *newPost>`
      := (CodeBlock)`<CompiledInstruction *post>`)
    {
      post = newPost;
      statements += ["<store>"];
    }      
    writeValue = composeWriteValue(statements);
    insert (CodeBlock)`<CompiledInstruction* pre><WriteValue writeValue><CompiledInstruction *post>`;
  }
  
  /// Compare
  case (CodeBlock)`<CompiledInstruction* pre> <CompareInstruction compare> <CompiledInstruction *post>`:
  {
    statements = ["<compare>"];
    while((CodeBlock)`<CompareInstruction compare><CompiledInstruction *newPost>`
      := (CodeBlock)`<CompiledInstruction *post>`)
    {
      post = newPost;
      statements += ["<compare>"];
    }      
    compareValue = composeCompareValue(statements);
    insert (CodeBlock)`<CompiledInstruction* pre><CompareValue compareValue><CompiledInstruction *post>`;
  }  
  
  /// Compare
  case (CodeBlock)`<CompiledInstruction* pre> <ReadValue read> <CompareValue compare> <CompiledInstruction *post>`:
  {
    compareValue = composeCompareValue(read, compare);
    insert (CodeBlock)`<CompiledInstruction* pre><CompareValue compareValue><CompiledInstruction *post>`;
  }
  
  // AndEqual: AND 0.1, Compare, store to B, AND B == AND (Compare)
  case (CodeBlock)`<CompiledInstruction* pre><
  SourcePrefix spx>16 00000.1<WhiteSpace ws><NewLine nl><
  CompareValue compare><
  StoreBit store><
  AndInstruction readData><
  CompiledInstruction *post>`:
  {
    if(bitAddress(store) == bitAddress(readData))
    {
      andEqual = composeAndEqual(composeSourceRange(spx, readData), compare);
      insert((CodeBlock)`<CompiledInstruction* pre><AndEqual andEqual><CompiledInstruction *post>`);
    }
    else
    {
      fail;
    }
  }
  
  /// LogicCondition
  case (CodeBlock) `<CompiledInstruction* pre> <LogicInstruction logic> <CompiledInstruction* post>`:
  {
    statements = [logic];
    while((CodeBlock)`<LogicInstruction logic><CompiledInstruction* newPost>`
    := (CodeBlock)`<CompiledInstruction* post>`)
    {
      post = newPost;
      statements += [logic];      
    }
    logicBlock = composeLogicCondition(statements);
    insert((CodeBlock)`<CompiledInstruction* pre><LogicCondition logicBlock><CompiledInstruction *post>`);
  }
  
  /// Trigger
  case (CodeBlock) `<CompiledInstruction* pre><LogicCondition condition><EventInstruction trigger><CompiledInstruction* post>`:
  {
    triggerBlock = composeTrigger(condition, trigger);
    insert((CodeBlock)`<CompiledInstruction* pre><TriggerBlock triggerBlock><CompiledInstruction *post>`);
  }
  
  /// BitTrigger
  case (CodeBlock) `<CompiledInstruction* pre><TriggerBlock triggerBlock><AssignBit assignBit><CompiledInstruction* post>`:
  {
    // Make sure to include multiple assigns as well!
    bitTrigger = composeBitTrigger(triggerBlock, assignBit);
    debugPrint("inserting trigger: <bitTrigger>");
    insert((CodeBlock)`<CompiledInstruction* pre><BitTrigger bitTrigger><CompiledInstruction *post>`);
  } 
  
  /// Assign
  case (CodeBlock)`<CompiledInstruction *pre> <ReadValue read> <WriteValue write> <CompiledInstruction *post>`:
  {
    assignValue = composeAssign(read, write);
    insert((CodeBlock)`<CompiledInstruction* pre><AssignValue assignValue> <CompiledInstruction *post>`);  
  }
};

// (partial) model representations
ReadValue composeReadValue(list[str] statements) = parse(#ReadValue, "<composeEcbPrefix("Chocolate", statements)>ReadValue <addressRange(statements)>");
WriteValue composeWriteValue(list[str] statements) = parse(#WriteValue, "<composeEcbPrefix("Lime", statements)>WriteValue <addressRange(statements)>");
CompareValue composeCompareValue(list[str] statements) = parse(#CompareValue, "<composeEcbPrefix("LightSeaGreen", statements)>CompareValue <addressRange(statements)>");
CompareValue composeCompareValue(ReadValue readValue, CompareValue compareValue) = parse(#CompareValue, "<composeEcbPrefix("LightSeaGreen", composeSourceRange(readValue, compareValue))>CompareValue <addressRange(readValue, compareValue)>");
AssignValue composeAssign(ReadValue readValue, WriteValue writeValue) = parse(#AssignValue, "<composeEcbPrefix("Lime", composeSourceRange(readValue, writeValue))>AssignValue <addressRange(readValue, writeValue)>");
AssignConstant composeAssignConstant(FetchConstantInstruction readConstant, WriteValue writeValue) = parse(#AssignConstant, "<composeEcbPrefix("Lime", composeSourceRange(readConstant, writeValue))>AssignConstant <getAddress(readConstant)> to <addressRange(writeValue)>");
AndEqual composeAndEqual(SourceRange programLines, CompareValue compare) = parse(#AndEqual, "<composeEcbPrefix("Tomato", programLines)>AndEqual <addressRange(compare)> to <addressRange(compare)>"); 
NopBlock composeNopBlock(SourceRange programLines) = parse(#NopBlock, "<composeEcbPrefix("LightGrey", programLines)>NopBlock");
LogicCondition composeLogicCondition(list[LogicInstruction] statements) = parse(#LogicCondition, "<composeEcbPrefix("Tomato", statements)>LogicCondition <formatLogic(statements)>");
TriggerBlock composeTrigger(LogicCondition condition, EventInstruction trigger) = parse(#TriggerBlock, "<composeEcbPrefix("OliveDrab", composeSourceRange(condition, trigger))>Trigger <bitAddress(trigger)> =\> <extractCondition(condition)>");
BitTrigger composeBitTrigger(TriggerBlock trigger, AssignBit triggerBit) = parse(#BitTrigger, "<composeEcbPrefix("Cyan", composeSourceRange(trigger, triggerBit))>BitTrigger <composeBitTrigger(trigger, bitAddress(triggerBit))>");

str composeBitTrigger(TriggerBlock trigger, str address)
{
  debugPrint("Composing: <address> and <trigger>");
  expression = "";
  visit(trigger)
  {
    case TriggerExpression LE:
    {
      return "<address> by <LE>";
    }    
  }
  return "UNKNOWN-TRIGGER-EXPRESSION"; 
}


str extractCondition(LogicCondition logic)
{
  visit(logic)
  {
    case LogicExpression L:
    {
      return "<L>";
    }
  }
  error = "Invalid logic whilst evaluating expressin: <logic>";
  handleError(error); 
  return error;
}

str formatLogic(list[LogicInstruction] statements)
{
  firstStatement = true;
  totalCondition = "" ;
  for(statement <- statements)
  {
    localCondition = "";
    debugPrint("visiting <statement>");    
    visit(statement)
    {
      case (LogicInstruction)`<SourcePrefix prefix>16 <BitAddress address><NewLine nl>`:
      {
        if(false == firstStatement)
        {
          localCondition += "AND ";
        } 
        localCondition += "<trim("<address>")> ";
        firstStatement = false;
      }
      case (LogicInstruction)`<SourcePrefix prefix>17 <BitAddress address><NewLine nl>`:
      {
        if(false == firstStatement)
        {
          localCondition += "AND ";
        } 
        localCondition += "NOT <trim("<address>")> ";
        firstStatement = false;   
      }
      case (LogicInstruction)`<SourcePrefix prefix>18 <BitAddress address><NewLine nl>`:
      {
        if(false == firstStatement)
        {
          localCondition += "OR ";          
        }
        localCondition += "<trim("<address>")> ";
        firstStatement = false;
      }
      case (LogicInstruction)`<SourcePrefix prefix>19 <BitAddress address><NewLine nl>`:
      {
        if(false == firstStatement)
        {
          localCondition += "OR ";
        }
        localCondition += "NOT <trim("<address>")> ";
        firstStatement = false;      
      }
            
      default:
        ;
    }  
    totalCondition += localCondition;  
  }
  debugPrint("total condition: <totalCondition>");
  return totalCondition;
}


