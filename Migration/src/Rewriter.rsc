module Rewriter

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
  // Toss away empty lines
  case (CodeBlock) `<CompiledInstruction* pre><EmptyLine _><CompiledInstruction *post>`:
  {
    debugPrint("Removing empty line");
    insert (CodeBlock)`<CompiledInstruction* pre><CompiledInstruction* post>`;
  }

  /// ResetCondition is an unused part?
  case (CodeBlock) `<CompiledInstruction* pre><
    SourcePrefix prefix>17 00000.1<WhiteSpace _><NewLine _><
    SkipInstruction nop><
    CompiledInstruction *post>`:
  {
    blank = parse(#BlankAndNot, debugPrint("BlankAndNot:", "<composeEcbPrefix("Brown", composeSourceRange(prefix, nop))>BlankAndNot"));
    insert(CodeBlock)`<CompiledInstruction *pre><QuickJumpOut blank><CompiledInstruction *post>`;
  }
  
  /// Quick JumpOut is a Small Speed optimizaltion
  case (CodeBlock) `<CompiledInstruction* pre><
    SourcePrefix prefix>17 00000.1<WhiteSpace _><NewLine _><
    JumpInstruction jump><
    CompiledInstruction *post>`:
  {
    speed = parse(#QuickJumpOut, debugPrint("QuickJumpOut:", "<composeEcbPrefix("Brown", composeSourceRange(prefix, jump))>QuickJumpOut"));
    insert(CodeBlock)`<CompiledInstruction *pre><QuickJumpOut speed><CompiledInstruction *post>`;
  } 

  /// NopBlock
  case (CodeBlock) `<CompiledInstruction* pre><SkipInstruction firstNop><CompiledInstruction* post>`:
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
  
  /// ReadValue
  case (CodeBlock)`<CompiledInstruction* pre><FetchInstruction fetch><CompiledInstruction *post>`:
  {
    statements = ["<fetch>"];
    while((CodeBlock)`<FetchInstruction fetch><CompiledInstruction *newPost>`
      := (CodeBlock)`<CompiledInstruction *post>`) 
    {
      post = newPost;
      statements += ["<fetch>"];
    }      
    readValue = composeReadValue(statements);
    insert (CodeBlock)`<CompiledInstruction* pre><ReadValue readValue><CompiledInstruction *post>`;
  }
 
  /// IOSynchronization
  case (CodeBlock)`<CompiledInstruction* pre><IOInstruction lstio><IOInstruction endio><CompiledInstruction *post>`:
  {
    debugPrint("Found an IO sync");
    ioSynchronization = composeIOSynchronization(["<lstio>", "<endio>"]);
    insert (CodeBlock)`<CompiledInstruction* pre><IOSynchronization ioSynchronization><CompiledInstruction *post>`;
  }
 
  /// AssignConstant
  case (CodeBlock)`<CompiledInstruction* pre><
  FetchConstantInstruction fetch><
  WriteValue store><
  CompiledInstruction *post>`:
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
    
  /// WriteValue
  case (CodeBlock)`<CompiledInstruction* pre><StoreValue store><CompiledInstruction *post>`:
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
  case (CodeBlock)`<CompiledInstruction* pre><CompareInstruction compare><CompiledInstruction *post>`:
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
  case (CodeBlock)`<CompiledInstruction* pre><ReadValue read><CompareValue compare><CompiledInstruction *post>`:
  {
    compareValue = composeCompareValue(read, compare);
    insert (CodeBlock)`<CompiledInstruction* pre><CompareValue compareValue><CompiledInstruction *post>`;
  }
  
  // AndEqual => Rename to ' Bit Assign' 
  case (CodeBlock)`<CompiledInstruction* pre><
    LogicCondition logic><
    CompareValue compare><
    StoreBit store><    
    CompiledInstruction *post>`:
  {
    debugPrint("Found Assign Bit statement");
    if("00000.1" == bitAddress(logic))
    {
      andEqual = composeAndEqual(composeSourceRange(logic, store), compare, store);
      insert((CodeBlock)`<CompiledInstruction* pre><AndEqual andEqual><CompiledInstruction *post>`);
    }
    else
    {
      fail;
    }
  }
  
  /// LogicCondition
  case (CodeBlock) `<CompiledInstruction* pre><LogicInstruction logic><CompiledInstruction* post>`:
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
  
  /// AssignValue
  case (CodeBlock)`<CompiledInstruction *pre><ReadValue read><WriteValue write><CompiledInstruction *post>`:
  {
    //visit(read)
    //{
    //  case SourceRange SR:
    //  {
    //    visit(SR)
    //    {
    //      case FiveDigits FD:
    //      {
    //        if(contains("<FD>", "106"))
    //        {
    //          insert((CodeBlock)`<CompiledInstruction* pre><AssignSetpoint assignSetpoint><CompiledInstruction *post>`);   
    //        }
    //      }
    //    }
    //  } 
    //}
    assignValue = composeAssign(read, write);
    insert((CodeBlock)`<CompiledInstruction* pre><AssignValue assignValue><CompiledInstruction *post>`);  
  }
  
  /// AssignBooleanExpression
  case (CodeBlock)`<CompiledInstruction *pre><LogicCondition condition><AssignBit bit><CompiledInstruction *post>`:
  {
    debugPrint("Found a boolean assign using EQL");
    bits = [bit] ;
    while((CodeBlock)`<AssignBit bit><CompiledInstruction *newPost>` 
      := (CodeBlock)`<CompiledInstruction *post>`)
    {
      debugPrint("Total: <size(bits)> bits");
      bits += bit;
      post = newPost;
    }
    boolExpression = composeBooleanExpression(condition, bits);
    insert((CodeBlock)`<CompiledInstruction* pre><AssignBooleanExpression boolExpression><CompiledInstruction *post>`);
  }
    
  /// IfBlock => Condition with a JUMP 
  case (CodeBlock)`<CompiledInstruction *pre><
    LogicCondition logic><
    SourcePrefix prefix>30<WhiteSpace _><WordAddress size><NewLine _><
    CompiledInstruction *post>`:
  {
    debugPrint("Found an IF-block");
    ifBlock = parse(#IfBlock, debugPrint("If Block:", "<composeEcbPrefix("Brown", composeSourceRange(logic, prefix))>IfBlock <logicExpression(logic)>size <trim("<size>")>"));
    insert((CodeBlock)`<CompiledInstruction* pre><IfBlock ifBlock><CompiledInstruction *post>`);
  } 
  
};

// (partial) model representations
ReadValue composeReadValue(list[str] statements) = parse(#ReadValue, "<composeEcbPrefix("Chocolate", statements)>ReadValue <addressRange(statements)>");
WriteValue composeWriteValue(list[str] statements) = parse(#WriteValue, "<composeEcbPrefix("Lime", statements)>WriteValue <addressRange(statements)>");
CompareValue composeCompareValue(list[str] statements) = parse(#CompareValue, "<composeEcbPrefix("LightSeaGreen", statements)>CompareValue <addressRange(statements)>");
IOSynchronization composeIOSynchronization(list[str] statements) = parse(#IOSynchronization, debugPrint("Composed IO sync: ", "<composeEcbPrefix("Brown", statements)>IOSynchronization <ioRange(statements)>"));
CompareValue composeCompareValue(ReadValue readValue, CompareValue compareValue) = parse(#CompareValue, "<composeEcbPrefix("LightSeaGreen", composeSourceRange(readValue, compareValue))>CompareValue <addressRange(readValue, compareValue)>");
AssignValue composeAssign(ReadValue readValue, WriteValue writeValue) = parse(#AssignValue, "<composeEcbPrefix("Lime", composeSourceRange(readValue, writeValue))>AssignValue <addressRange(readValue, writeValue)>");
AssignConstant composeAssignConstant(FetchConstantInstruction readConstant, WriteValue writeValue) = parse(#AssignConstant, "<composeEcbPrefix("Lime", composeSourceRange(readConstant, writeValue))>AssignConstant <getAddress(readConstant)> to <addressRange(writeValue)>");
AndEqual composeAndEqual(SourceRange programLines, CompareValue compare, StoreBit result) = parse(#AndEqual, debugPrint("AndEqual:", "<composeEcbPrefix("Tomato", programLines)>AndEqual <compareRange(compare)> =\> <bitAddress(result)> ")); 
NopBlock composeNopBlock(SourceRange programLines) = parse(#NopBlock, "<composeEcbPrefix("LightGrey", programLines)>NopBlock");
LogicCondition composeLogicCondition(list[LogicInstruction] statements) = parse(#LogicCondition, "<composeEcbPrefix("Tomato", statements)>LogicCondition <formatLogic(statements)>");
TriggerBlock composeTrigger(LogicCondition condition, EventInstruction trigger) = parse(#TriggerBlock, "<composeEcbPrefix("OliveDrab", composeSourceRange(condition, trigger))>Trigger <bitAddress(trigger)> =\> <extractCondition(condition)>");
BitTrigger composeBitTrigger(TriggerBlock trigger, AssignBit triggerBit) = parse(#BitTrigger, "<composeEcbPrefix("Cyan", composeSourceRange(trigger, triggerBit))>BitTrigger <composeBitTrigger(trigger, bitAddress(triggerBit))>");
AssignBooleanExpression composeBooleanExpression(LogicCondition condition, list[AssignBit] bits )
{
  sourceRange = debugPrint(composeSourceRange(condition, last(bits)));
  condition = debugPrint(extractCondition(condition));
  bitInfo = "";
  for(bit <- bits)
  {
    visit(bit)
    {
      case BitAddress BA:
      {
        bitInfo += "<trim("<BA>")> ";
      }
    }
  }
  total = debugPrint("<trim("<composeEcbPrefix("Yellow", sourceRange)>AssignBooleanExpression <condition>")> to <bitInfo>");
  return parse(#AssignBooleanExpression, total);
}

str logicExpression(&T logicItem)
{
  visit(logicItem)
  {
    case LogicExpression LE:
    {
      return "<LE>";
    } 
  }
  return "NO_LOGIC_EXPRESSION";
}

str jumpSize(&T jumpInstruction)
{
  visit(jumpInstruction)
  {
    case WordAddress WA:
    {
      return "<WA>";
    }
  }
  handleError("No size found");
  return "NO_SIZE_IN_JUMP";
}

str compareRange(CompareValue compareValue)
{
  visit(compareValue)
  {
    case CompareStatement CS:
    {
      return "<CS>";
    }    
  }
  return handleError("Unable to find info for comparison");
}

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
  return "UNKNOWN_TRIGGER_EXPRESSION"; 
}


str extractCondition(LogicCondition logic)
{
  visit(logic)
  {
    case LogicExpression L:
    {
      debugPrint("-|<L>|-");
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

str ioRange(list[str] statements) = "00000 to 12345";