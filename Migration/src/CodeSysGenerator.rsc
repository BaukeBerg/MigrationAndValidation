module CodeSysGenerator

import FileLocations;
import IO;
import List;
import ParseTree;
import PC20Syntax;
import String;
import Environment;
import CodesysSyntax;
import CodesysTypes;

import utility::Debugging;
import utility::FileUtility;
import utility::ListUtility;
import utility::MathUtility;
import utility::StringUtility;

import vis::ParseTree;

// Those variables are not declared, but are provided by the Framework the code is entered into 
public SymbolTable systemVariables = [<"AlwaysOne", "0.1", "Constant with value TRUE", "BOOL">,
                               <"SUPPLY_ERROR", "0.2", "Bit Flag indicating power faiture", "BOOL">,
                               <"_CLOCK_10ms", "0.3", "10ms interval with 50 percent duty cycle", "BOOL">,
                               <"_CLOCK_100ms", "1.0", "100ms interval with 50 percent duty cycle", "BOOL">,
                               <"_CLOCK_1s", "1.1", "1s interval with 50 percent duty cycle", "BOOL">,
                               <"_CLOCK_10s", "1.2", "10s interval with 50 percent duty cycle", "BOOL">,
                               <"_CLOCK_60s", "1.3", "60s interval with 50 percent duty cycle", "BOOL">];
                                
PlcProgram generateFile(str outputPath, Tree plcModel, SymbolTable symbols)
{
  PlcProgram program = extractInformation(plcModel, symbols);  
  generateProgram(outputPath, program);
  return program;
}

PlcProgram extractInformation(Tree plcModel, SymbolTable symbols)
{
  debugPrint("---------- Starting information extraction @ <formatDuration()> ----------");
  bool openCondition = false;
  includedLines = 0;
  programLines = [];
  startIfPositions = [];
  endIfPositions = [];  
  Variables variableList = convertSymbols(symbols-systemVariables);
  actualProgramCount = 0;
  //variableList = simplifyVariables(variableList); => Do this with rewrite of symbols
  variableList += "\r\n(* Local variables generated by Rascal *)";
  visit(plcModel)
  {
    case EmptyLine EL:
    {
      ;
      // programLines += "(* <removeNewLines("<EL>")> *)";
    }
    
    case BlankAndNot ECB:
    {
      programLines = houseKeeping(ECB, startIfPositions, endIfPositions, programLines);
      programLines += "(* <ECB> *)";
      programLines += "; (* ANDNT 0.1 NOP is a Blank Instruction *)";
      visit(ECB)
      {
        case SourceLineRange SR:
        {
          actualProgramCount = debugPrint("BlankAndNot: ", lastInteger("<SR>"));
        }
        default:
          ;
      }
      includedLines += extractSize(ECB); 
    }
    
    case CompareWithResult CR:
    {
      programLines = houseKeeping(CR, startIfPositions, endIfPositions, programLines);
      programLines += debugPrint("CR: ", "(* <CR> *)");
      sources = [];
      targets = [];
      resultValue = "";
      visit(CR)
      {
        case CompareStatement Compare:
        {
          visit(Compare)
          {
            case SourceRange SR:
            {
              sources = split(",", "<SR>");
            } 
            case TargetRange TR:
            {
              targets = split(",", "<TR>");
            }           
          }
        } 
        case WordAddress WA:
        {
          resultValue = trim("<WA>");
        }       
      }
      if(size(sources) != size(targets))
      {
        handleError("sources and targets differ: sources: <sources>, targets: <targets>");
      }
      else
      { 
        sourceInt = composeInteger(sources, symbols);
        targetInt = composeInteger(targets, symbols);
        targetInfo = retrieveInfo(resultValue, symbols);
        targetName = targetInfo.name;
        programLines += ["(* <targetInfo.comment> *)", 
          "<targetName>.0 := <sourceInt> = <targetInt>; ",
          "<targetName>.1 := <sourceInt> \< <targetInt>;",
          "<targetName>.2 := <sourceInt> \> <targetInt>;",
          "<targetName>.3 := <sourceInt> \<\> <targetInt>;"
          ];
      }
      
      
      includedLines += extractSize(CR);
    }
    case IfBlock IB:
    {
      programLines = houseKeeping(IB, startIfPositions, endIfPositions, programLines);
      programLines += "(* <IB> *)";
      visit(IB)
      {
        case LogicExpression LE:
        {
          programLines += ["IF <evaluateExpression(LE, symbols)> THEN <formatComment(LE, symbols)>"];          
        }
        case SourceLineRange SR:
        {
          actualProgramCount = lastInteger("<SR>");
        }
        case JumpSize JS:
        {
          endIfPositions += (parseInt(JS) + actualProgramCount); // Notify on what position the END_IF goes
          debugPrint("Inserted END_IF pos: <last(endIfPositions)>");
        }
      }      
      includedLines += extractSize(IB);
    }
       
    case DecrementCounter DC:
    {
      programLines = houseKeeping(IO, startIfPositions, endIfPositions, programLines);
      programLines += "(* <DC> *)";
      addresses = [];
      str target = "";      
      visit(DC)
      {
        case AddressRange AR:
        {        
          visit(AR)
          {
            case FiveDigits WA:
            {
              addresses += ["<WA>"];
            }
          }
        }        
        case BitAddress BA:
        {
          target = "<BA>";
        }
      }
      includedLines += extractSize(DC);
      if(2 == size(addresses))
      {
        ones = retrieveVariableName(addresses[0], symbols);
        tens = retrieveVariableName(addresses[1], symbols);
        programLines += ["IF <ones> \> 0 THEN (* <retrieveComment("<ones>", symbols)> *)",
                        "  <ones> := <ones> - 1 ;",
                        "ELSIF <tens> \> 0 THEN (* <retrieveComment("<tens>", symbols)> *)",
                        "  <ones> := 9;",
                        "  <tens> := <tens> - 1 ;",
                        "ELSE (* Timer underflow, rolling over to maximum value *)",
                        "  <ones> := 9;",
                        "  <tens> := 9;",                        
                        "END_IF;",
                        "<retrieveVariableName("<target>", symbols)> := (0 = <ones>) AND (0 = <tens>) ; (* <retrieveComment("<target>", symbols)> *)"
                        ];
      }
      else if(4 == size(addresses))
      {
        ones = retrieveVariableName(addresses[0], symbols);
        tens = retrieveVariableName(addresses[1], symbols);
        hundreds = retrieveVariableName(addresses[2], symbols);
        thousands = retrieveVariableName(addresses[3], symbols);
        programLines += ["IF <ones> \> 0 THEN (* <retrieveComment("<ones>", symbols)> *)",
                        "  <ones> := <ones> - 1 ;",
                        "ELSIF <tens> \> 0 THEN (* <retrieveComment("<tens>", symbols)> *)",
                        "  <ones> := 9;",
                        "  <tens> := <tens> - 1 ;",
                        "ELSIF <hundreds> \> 0 THEN (* <retrieveComment("<hundreds>", symbols)> *)",
                        "  <ones> := 9;",
                        "  <tens> := 9;",
                        "  <hundreds> := <hundreds> - 1 ;",
                        "ELSIF <thousands> \> 0 THEN (* <retrieveComment("<thousands>", symbols)> *)",
                        "  <ones> := 9;",
                        "  <tens> := 9;",
                        "  <hundreds> := 9;",
                        "  <thousands> := <thousands> - 1 ;",
                        "ELSE (* Timer underflow, rolling over to maximum value *)",
                        "  <ones> := 9;",
                        "  <tens> := 9;",
                        "  <hundreds> := 9;",
                        "  <thousands> := 9;",
                        "END_IF;",
                        "<retrieveVariableName("<target>", symbols)> := (0 = <ones>) AND (0 = <tens>) AND (0 = <hundreds>) AND (0 = <thousands>) ; (* <retrieveComment("<target>", symbols)> *)"                        
                        ];
               
      }
      else
      {
        handleError("Invalid counter size: <size(addresses)>");
        for(i <- addresses)
        {
          handleError("Count address: <i>");
        }
      }
        
    }
    
    case ComposeValue CV:
    {
      //programLines = houseKeeping(CV, startIfPositions, endIfPositions, programLines);
      programLines += "(* <CV> *) ";
      target = "";
      bitValues = [];
      visit(CV)
      {
        case WordAddress WA:
        {
          target = "<WA>";
        }
        case BitAddress BA:
        {
          bitValues += ["<BA>"];
        }        
      }
      bitString = "";
      targetData = retrieveInfo(target, symbols);
      programLines += "(* <targetData.comment> *)" ; 
      for(bit <- bitValues)
      {                
        bitData = retrieveInfo(bit, symbols);
        programLines += "<targetData.name>.<indexOf(bitValues, bit)> := <bitData.name> ; (* <bitData.comment> *)";        
      }
      includedLines += extractSize(CV);      
    }
    
    case CompareConstant CC:
    {
      programLines = houseKeeping(CC, startIfPositions, endIfPositions, programLines);
      programLines += "(* <CC> *)" ;
      constantValue = compareAddress = <"", "">;
      visit(CC)
      {
        case ConstantValue CV:
        {
          constantValue = "<CV>";
        }
        
        case WordAddress WA:
        {
          compareAddress = "<WA>";
        }
        
        case BitAddress BA:
        {
          targetData = retrieveInfo("<BA>", symbols);
          sourceData = retrieveInfo(compareAddress, symbols);
          programLines += "<targetData.name> := (<constantValue> = <sourceData.name>) ; (* <targetData.comment> := (<constantValue> = <sourceData.comment>) *) ";
        }
      }
      includedLines += extractSize(CC);
    }
    
    case ResetBit SB:
    {
      programLines = houseKeeping(SB, startIfPositions, endIfPositions, programLines);
      programLines += "(* <SB> *)" ;
      visit(SB)
      {
        case BitAddress BA:
        {          
          programLines += "<retrieveVariableName("<BA>", symbols)> := FALSE ; (* <retrieveComment("<BA>", symbols)> *)" ;
        }
        default:
          ;
      }
      includedLines += 1;
    }
    
    case SetBit SB:
    {
      programLines = houseKeeping(SB, startIfPositions, endIfPositions, programLines);
      programLines += "(* <SB> *)" ;
      visit(SB)
      {
        case BitAddress BA:
        {
          programLines += "<retrieveVariableName("<BA>", symbols)> := TRUE ; (* <retrieveComment("<BA>", symbols)> *)" ;
        }
        default:
          ;
      }
      includedLines += 1;
    }
    
    case IOSynchronization IO:
    {
      programLines = houseKeeping(IO, startIfPositions, endIfPositions, programLines);
      programLines += ["; (* <IO> *)", "(* IO Syncing is handled by the PLC automatically *)"];
    }
        
    case IOJump IO:
    {
      programLines = houseKeeping(IO, startIfPositions, endIfPositions, programLines);
      programLines += ["; (* <IO> *)", "(* IO Syncing is handled by the PLC automatically, so ingore the jump *)"];
    }
    
    case ExecuteInstruction EL:
    {
      programLines = houseKeeping(EL, startIfPositions, endIfPositions, programLines);
      programLines += defaultFormat(EL);
    }
    
    case ConditionInstruction EL:
    {
      programLines = houseKeeping(EL, startIfPositions, endIfPositions, programLines);
      programLines += defaultFormat(EL);
    }
    
    case SkipInstruction EL:
    {
      programLines = houseKeeping(EL, startIfPositions, endIfPositions, programLines);
      programLines += defaultFormat(EL);
    }
    
    case IOInstruction EL:
    {
      programLines = houseKeeping(EL, startIfPositions, endIfPositions, programLines);
      programLines += ["(* <trim("<EL>")> ", "; Separate IO instruction are alledgedly used for remote configuration *)"];
    }
    
    case SingleInstruction EL:
    {
      programLines = houseKeeping(EL, startIfPositions, endIfPositions, programLines);
      programLines += defaultFormat(EL);
    }
    
    case ConditionInstruction EL:
    {
      programLines = houseKeeping(EL, startIfPositions, endIfPositions, programLines);
      programLines += defaultFormat(EL);
    }
    
    case Error EL:
    {
      programLines = houseKeeping(EL, startIfPositions, endIfPositions, programLines);
      programLines += defaultFormat(EL);
    }  
    
    /// Composed instructions, used for pattern matching   
    case ReadValue EL:
    {
      programLines = houseKeeping(EL, startIfPositions, endIfPositions, programLines);
      programLines += defaultFormat(EL);
    } 
    
    case WriteValue EL:
    {
      programLines = houseKeeping(EL, startIfPositions, endIfPositions, programLines);
      programLines += defaultFormat(EL);
    } 
    
    case OtherBlock EL:
    {
      programLines = houseKeeping(EL, startIfPositions, endIfPositions, programLines);
      programLines += defaultFormat(EL);
    }   
    
    case PartialRead EL:
    {
      programLines = houseKeeping(EL, startIfPositions, endIfPositions, programLines);
      programLines += defaultFormat(EL);
    }
    
    case PartialWrite EL:
    {
      programLines = houseKeeping(EL, startIfPositions, endIfPositions, programLines);
      programLines += defaultFormat(EL);
    }
    
    case ComposedWrite EL:
    {
      programLines = houseKeeping(EL, startIfPositions, endIfPositions, programLines, openCondition);
      openCondition = true;      
      writeCondition = "";
      writeTarget = "";
      targetAddresses = [];
      sourceAddresses = [];
      list[str] triggerStatements = [];
      programLines += "(* <EL> *)";
      list[str] logicStatements = [];
      visit(EL)
      {
        case PartialWriteContent PWC:
        {
          visit(PWC)
          {
            case LogicExpression LE:
            {
              writeCondition = debugPrint("Logic exp:", "IF <evaluateExpression(LE, symbols)> THEN <formatComment(LE, symbols)>");              
            }
            case AddressRange AR:
            {
              visit(AR)
              {
                case FiveDigits FD:
                {
                  targetAddresses += debugPrint("TargetAddress:", "<FD>");
                }
              }
            }
          }
        }
      }
      visit(EL)
      {
        case PartialReadContent PRC:
        {
          list[str] totalStatement = [];
          sourceAddresses = [];
          isTrigger = false;
          visit(PRC)
          {
            case LogicExpression LE:
            {
              debugPrint("before logic");
              totalStatement = ["IF <evaluateExpression(LE, symbols)> THEN <formatComment(LE, symbols)>"];
              debugPrint("after logic");
            }
            case TriggerExpression TE:
            {
              isTrigger = true;
              list[str] statements = [];
              <declaration, statements> = evaluateTrigger(TE, symbols);
              variableList += extractVariable(declaration);
              triggerStatements += statements + "  ";
              totalStatement = ["IF <retrieveVariableName(declaration.address, symbols)> THEN (* <declaration.comment> *)"];
                                            
            }
            case AddressRange AR:
            {
              visit(AR)
              {
                case FiveDigits FD:
                {
                  sourceAddresses += debugPrint("Added source item", "<FD>");
                }
              }
            }
          }
          if(size(sourceAddresses) != size(targetAddresses))
          {
            handleError("Size of addresses do not match. Sources (<size(sourceAddresses)>): <sourceAddresses>, Targets (<size(targetAddresses)>): <targetAddresses>");
          }
          else
          {
            debugPrint("before total");debugPrint("before logic");
            for(index <- [0..size(sourceAddresses)])
            { 
              totalStatement += debugPrint("Generating Assign: ", evaluateAssign(symbols, sourceAddresses[index], targetAddresses[index])[0]);              
            }
            debugPrint("after total");     
          }          
          totalStatement = closeIf(totalStatement);
          logicStatements += totalStatement;          
        }
      }
      programLines += debugPrint("Triggers", triggerStatements);
      programLines += debugPrint("WriteCondition", writeCondition);
      programLines += debugPrint("Logic", logicStatements);      
      openCondition = true;
    }
        
    case QuickJumpOut EL:
    {
      programLines = houseKeeping(EL, startIfPositions, endIfPositions, programLines);
      programLines += ["(* <EL> *)", "(* Might be replaceable by a IF .. ELSIF .. ELSE or CASE *)"];
    }
    
    case AndEqual EL:      
    {
      programLines = houseKeeping(EL, startIfPositions, endIfPositions, programLines, openCondition);
      openCondition = false;
      debugPrint("Composing AndEqual");
      str target = "UNDEFINED_ADDRESS";
      visit(EL)
      {
        case BitAddress BA:
        {
          target = "<BA>";
        }
      }
      programLines += ["(* <removeNewLines("<EL>")> *)","(* Target variable comment: <retrieveComment(target, symbols)> *)"];
      statements = extractStatements(EL, symbols);
      programLines += ["<retrieveVariableName(target, symbols)> := <statements[0]>"];
      if(1 < size(statements))
      {
        programLines += statements[1..];
      } 
      programLines += "; (* End of AndEqual *)";
      programLines += "  ";
      includedLines += extractSize(EL);
    }                

    case AssignBooleanExpression EL:
    {
      programLines = houseKeeping(EL, startIfPositions, endIfPositions, programLines, openCondition);
      openCondition = false;
      programLines += "(* <EL> *)";
      bitString = "";
      logicString = "";
      bitComment = "(* ";
      logicComment = "";
      visit(EL)
      {
        case BitAddressRange BR:
        {
          visit(BR)
          {
            case BitAddress BA:
            {
              bitInfo = retrieveInfo("<BA>", symbols);
              bitString += "<bitInfo.name> := ";
              bitComment += "<bitInfo.comment> ";
            }
          } 
        }
        
        case LogicExpression LE:
        {
          logicString = "<evaluateExpression(LE, symbols)>";
          logicComment = "<formatComment(LE, symbols)>";
        }
      }
      bitComment += "*)";
      programLines += [bitComment, logicComment, "<bitString> <logicString> ; "];      
    }         
        
    case AssignConstant A:
    {
      programLines = houseKeeping(A, startIfPositions, endIfPositions, programLines);
      includedLines += extractSize(A);      
      programLines += extractStatements(A, symbols);
    }
    
    case AssignValue A:
    {
      programLines = houseKeeping(A, startIfPositions, endIfPositions, programLines);
      actualProgramCount = lastProgramCount(A);
      includedLines += extractSize(A);
      programLines += extractStatements(A, symbols);
      
    }
     
    case TriggerBlock T:
    {
      programLines = houseKeeping(T, startIfPositions, endIfPositions, programLines, openCondition);
      programLines += "(* <T> *)";
      openCondition = false;
      visit(T)
      {
        case TriggerExpression TE:
        {
          <declaration, statements> = evaluateTrigger(TE, symbols);
          variableList += extractVariable(declaration);
          programLines += statements;  
        }
      }
    } 
        
    case BitTrigger B:
    {
      programLines = houseKeeping(B, startIfPositions, endIfPositions, programLines, openCondition);
      programLines += "(* <B> *)";
      openCondition = false;      
      includedLines += extractSize(B);
      <declaration, statements> = evaluateTrigger(B, symbols);
      variableList += declaration;
      programLines += statements;
    }
    
    case TriggerBlock EL:
    {
      programLines = houseKeeping(EL, startIfPositions, endIfPositions, programLines, openCondition);
      openCondition = false;      
      <declaration, statements> = evaluateTrigger(EL, symbols);
      variableList += extractVariable(declaration);;
      programLines += statements;
    } 
    
    case CompareValue CV:
    {
      programLines = houseKeeping(CV, startIfPositions, endIfPositions, programLines);
      actualProgramCount = programCount(CV);
      debugPrint("CompareValue");
      includedLines += extractSize(CV);
      programLines += extractStatements(CV, symbols);
    }
    
    case LogicCondition ECB:
    {
      programLines = houseKeeping(ECB, startIfPositions, endIfPositions, programLines, openCondition);
      openCondition = false;
      actualProgramCount = programCount(ECB); 
      blockSize = extractSize(ECB);   
      includedLines += extractSize(ECB);      
      visit(ECB)
      {
        case LogicExpression LE:
        {
          programLines += ["(* <ECB> *)", "IF <evaluateExpression(LE, symbols)> THEN <formatComment(LE, symbols)>"];
          openCondition = true;      
        }
      }
    }
    
    case NopBlock ECB:
    {
      programLines = houseKeeping(ECB, startIfPositions, endIfPositions, programLines);
      actualProgramCount = programCount(ECB);
      includedLines += extractSize(ECB);
      programLines += ["(* <ECB> *)", "; (* DoNothing *)", "  "];
    }
  } 
  
  programLines = houseKeeping(actualProgramCount+1, startIfPositions, endIfPositions, programLines, openCondition);
  debugPrint("Condition state: <openCondition>");
  debugPrint("If positions: <startIfPositions>");
  debugPrint("EndIf positions: <endIfPositions>");
  debugPrint("Total line amount included: <includedLines>");
  return <variableList,programLines>;
}

str composeInteger(list[str] targets, SymbolTable symbols)
{
  integerStatement = "";
  multiPlier = 1;
  for(target <- targets)
  {
    targetInfo = retrieveInfo(target, symbols);          
    integerStatement += "(<targetInfo.name> * <multiPlier>) + ";
    multiPlier *= 10;
  }
  return "(<replaceLast(integerStatement, " + ", "")>)";
}

Statements houseKeeping(&T item, list[int] startIfPositions, list[int] endIfPositions, Statements currentProgram) = houseKeeping(item, startIfPositions, endIfPositions, currentProgram, false);
Statements houseKeeping(&T item, list[int] startIfPositions, list[int] endIfPositions, Statements currentProgram, bool terminateCondition)
{
  currentCount = debugPrint("Insert", programCount(item));  
  if((currentCount in endIfPositions)
   || (currentCount-1) in endIfPositions)  
  {
    currentProgram = closeIf(currentProgram);
  }
  if(terminateCondition)
  {
  	return closeIf(currentProgram);
  }
  return currentProgram;
}

/// Convenience function, since last is provided, first is expected
int firstProgramCount(&T programItem) = programCount(programItem);

int lastProgramCount(&T programItem)
{
  visit(programItem)
  {
    case SourceLineRange SR:
    {
      return lastInteger("<SR>");
    }
  }
  handleError("No program count in <programItem>");
  return -1;
}

int programCount(int actualCount) = actualCount;

int programCount(&T programCountItem)
{
  debugPrint("Evaluating program counter: <programCountItem>");
  int actualCount = -1;
  visit(programCountItem)
  {
    case SourceLineRange SR:
    {
      debugPrint("Source line range");
      visit(SR)
      {
        case FiveDigits FD:
        {
          if(-1 == actualCount)
          {
            actualCount = parseInt(FD);
          }
        }
      }
    }
    case ProgramLineNumber PN:
    {
      debugPrint("Program number");
      actualCount = parseInt(PN);
    }
  }
  if(-1 == actualCount)
  {
    handleError("No program counter detected: <programCountItem>");
  }
  return debugPrint("Actual count: ", actualCount);
}


str defaultFormat(&T statement) =  "; (* Unexpanded: <removeNewLines("<statement>")> *)";
str removeNewLines(str inputString) = replaceAll(replaceAll(inputString, "\r", ""), "\n", "");

Statements closeIf(Statements programLines)
{
  count = 1;
  if("  " == last(programLines))
  {
    programLines = delete(programLines, size(programLines)-1); 
  }        
  programSize = size(programLines);
  
  for(line <- [1..programSize])
  {
    if(startsWith(programLines[programSize-line], "IF "))
    {
      count -= 1;
    }
    elseif(contains(programLines[programSize-line], "END_IF;"))
    {
      count += 1;
    }
    if(count == 0)
    {
      break;
    }
    programLines[programSize-line] = "  " + programLines[programSize-line];
  }
  if(startsWith(last(programLines), "IF "))
  {
    programLines += ["  ; (* EMPTY_IF_GUARD *)"];
  }
  programLines += ["END_IF;", "  "];
  return programLines;  
}

SymbolTable addSystemVariables(SymbolTable symbols)
{
  SymbolTable resultTable = systemVariables; 
  for(symbol <- symbols)
  {
    if(contains(symbol.address, systemVariables))
    {
      debugPrint("Skipping: <symbol>");
      continue;
    }
    resultTable += symbol;    
  }
  return resultTable;
}

SymbolTable addUndeclaredVariables(SymbolTable symbols, Tree parsedData)
{
  debugPrint("starting visit");
  visit(parsedData)
  {
    case WordAddress WA:
    { 
      varName = clipAndStrip("<WA>");
      if(false == contains(varName, symbols))
      { 
        debugPrint("unable to find WORD: --|<varName>|--");
        symbols += composeUnnamedDeclaration(varName, "INT");
      }
      
    }
    case BitAddress BA:
    {   
      varName = clipAndStrip("<BA>");            
      if(false == contains(varName, symbols))
      { 
        debugPrint("unable to find BIT --|<varName>|--");
        symbols += composeUnnamedDeclaration(varName, "BOOL");        
      }
      
    }
    default:
      ;
      
  }
  return symbols;
}

Symbol composeUnnamedDeclaration(str inputData, str dataType)
{
  debugPrint("Generating declaration for <dataType> <inputData>");
	addressName = replaceAll(trim("<clipAndStrip(inputData)>"), ".", "_");
  addressName = replaceAll(addressName, "=", "");    
  return <"unnamed_<trim(addressName)>", clipAndStrip("<inputData>"), "", dataType>;
}

int extractSize(&T codeBlock)
{
  visit(codeBlock)
  {
    case SourceLineRange range:
    {
      sources = split("-", "<range>");
      from = parseInt("<sources[0]>");
      to = parseInt("<sources[1]>");
      return to - from;
    }
  }
  return 0;       
}

tuple[str, list[str]] evaluateTrigger(BitTrigger B, SymbolTable symbols)
{
  Symbol triggerInstance = <"", "", "", "">;
  statements = [];
  variableName = "";
  triggerVariable = <"","">;
  tuple[str name, str comment] targetInfo = <"","">;
  LogicExpression logicExpression;
    
  visit(B)
  {
    case TriggerExpression TE:
    {
      <triggerInstance, statements> = evaluateTrigger(TE, symbols);      
    }

    case TriggerTarget TT:
    {
      targetInfo = retrieveInfo("<TT>", symbols);      
    }
  }
  statements += "<targetInfo.name> := <triggerInstance.name>.Q ; (* <triggerInstance.comment> *)" ;
  statements += "  ";    
  return <extractVariable(triggerInstance), statements>;
}


// Compose R_TRIG declaration for symbols, and composes the calls to the instance
tuple[Symbol declaration, list[str] statements] evaluateTrigger(TriggerExpression T, SymbolTable symbols)
{
  Symbol variableInfo = <"", "", "", "R_TRIG">;
  statements = [];
  clkExp = "";
  tuple[str name, str comment] resultInfo = <"","">;
  visit(T)
  {
    case TriggerResult TR:
    { 
      resultInfo = retrieveInfo("<TR>", symbols);
      variableInfo.name = "TRIGGER_<resultInfo.name>";
      variableInfo.address = "<TR>";
      variableInfo.comment = resultInfo.comment;          
    }
    
    case LogicExpression LE:
    {
      clkExp = "<evaluateExpression(LE, symbols)>, <formatComment(LE, symbols)>";          
    }
  }
  
  statements += formatName(variableInfo.name);
  statements += "(";
  statements += "  CLK := <clkExp>";
  statements += "  Q =\> <resultInfo.name>, (* <resultInfo.comment> *)";
  statements += ");";  
  return <variableInfo, statements>;
}

str evaluateExpression(LogicExpression logic, SymbolTable symbols)
{
  totalExpression = "";
  visit(logic)
  {
    case LogicOperation LO:
    {
      totalExpression += " " + "<LO>";
    }
    case BitAddress BA:
    {
      totalExpression += retrieveVariableName(trim("<BA>"), symbols);      
    }
  }
  return totalExpression;
}

Statements extractStatements(AssignConstant A, SymbolTable symbols)
{
  constantValues = [];
  statements = ["(* <A> *)"];
  addresses = [];
  debugPrint("Generating assign <A>");
  visit(A)
  {
    case ConstantValues C:
    {
      visit(C)
      {
        case FiveDigits F:
        {
          constantValues += parseInt("<F>");
        }
      }     
    }
    case AddressRange A:
    {
      visit(A)
      {
        case FiveDigits F:
        {
          addresses += "<stripLeading("<F>", "0")>";
        }
      }
    }      
  }
  
  lastConstantIndex = size(constantValues)-1; 
  debugPrint("amount of addresses: <size(addresses)>, amount of constants: <lastConstantIndex+1>");
       
  for(index <- [0..size(addresses)])
  {
    statements += evaluateAssign(symbols, addresses[index], constantValues[min(lastConstantIndex,index)]);  
  }
  statements += "  "; 
  return statements;    
}

Statements extractStatements(AssignValue A, SymbolTable symbols)
{
  statements = ["(* <A> *)"];
  sourceAddresses = [];
  targetAddresses = [];
  visit(A)
  {
    case SourceRange SR:
    {
      debugPrint("Range: <SR>");
      visit(SR)
      {
        case FiveDigits F:
        {
          sourceAddresses += "<stripLeading("<F>", "0")>";
        }
      }
    }
    case TargetRange TR:
    {
      visit(TR)
      {
        case FiveDigits F:
        {
          targetAddresses += "<stripLeading("<F>", "0")>";
        }
      }
    }
  }
  for(index <- [0..size(sourceAddresses)])
  {
    debugPrint("Evaluating <index>");
    statements += evaluateAssign(symbols, sourceAddresses[index], targetAddresses[index]);
  }
  statements += "  "; 
  return statements;
}

Statements extractStatements(&T compare, SymbolTable symbols)
{
  debugPrint("Evaluation compare: --|<compare>|--");
  sourceAddresses = [];
  targetAddresses = [];  
  visit(compare)
  {
    case SourceRange SR:
    {
      debugPrint("Range: <SR>");
      visit(SR)
      {
        case FiveDigits F:
        {
          sourceAddresses += "<stripLeading("<F>", "0")>";
        }
      }
    }
    case TargetRange TR:
    {
      visit(TR)
      {
        case FiveDigits F:
        {
          targetAddresses += "<stripLeading("<F>", "0")>";
        }
      }
    }
  }
  Statements statements = [];
  str prefix = "";
  for(index <- [0..size(sourceAddresses)])
  {
    if(index != 0)
    {
      prefix = "  AND";
    }    
    statements += "<prefix> (<retrieveVariableName(sourceAddresses[index], symbols)> = <retrieveVariableName(targetAddresses[index], symbols)>) (* (<retrieveComment(sourceAddresses[index], symbols)> = <retrieveComment(targetAddresses[index], symbols)>) *)";
  }  
  debugPrint("Returning result");
  return statements;
}

str formatComment(LogicExpression logicExpression, SymbolTable symbols)
{
  commentString = "(* ";
  visit(logicExpression)
  {
    case BitAddress BA:
    {
      address = clipAndStrip("<BA>");
      commentString += retrieveComment(address, symbols);
    }
    case LogicOperation LO:
    {
      commentString += " <LO>";
    } 
  }
  return commentString + " *)"; 
}

Statements evaluateAssign(SymbolTable symbols, str sourceAddress, str targetAddress)
{
  sourceName = retrieveVariableName(sourceAddress, symbols);
  targetName = retrieveVariableName(targetAddress, symbols);
  return["<targetName> := <sourceName> ; (* <retrieveComment(sourceAddress, symbols)> ==\>\> <retrieveComment(targetAddress, symbols)> *)"];   
}

Statements evaluateAssign(SymbolTable symbols, str address, int constantValue)
{
  if(true == isBoolean(address, symbols))
  {
    debugPrint("Boolean address <address>");
    Statements statements = [];
    for(bitAddress <- retrieveAddressList(address, symbols))
    {
      variableName = retrieveVariableName(bitAddress, symbols);
      debugPrint(variableName);
      statements += "<variableName> := <toUpperCase("<getBit(constantValue, lastInteger(bitAddress))>")> ; (* <retrieveComment(variableName, symbols)> *)";
    }    
    return statements;
  }
  else
  {
    debugPrint("Integer address <address>, constantValue <constantValue>");
    variableName = retrieveVariableName(address, symbols);
    return ["<variableName> := <constantValue> ; (* <retrieveComment(variableName, symbols)> *)"];
  }
}

void generateProgram(str outputPath, PlcProgram program) = writeToFile(generatedFile(outputPath), generateOutput(program));
list[str] generateOutput(PlcProgram program)
{
  totalFile = ["PROGRAM PC20_CYCLE", "VAR"];
  totalFile += program.declarations;
  totalFile += "END_VAR";
  totalFile += program.programLines;
  totalFile += "END_PROGRAM";
  return totalFile;
} 

Variables simplifyVariables(SymbolTable symbols) = simplifyVariables(convertSymbols(symbols));
Variables simplifyVariables(Variables variables)
{
  variableTree = innermost visit(parseVariables(variables))
  {
    case (PlcVariableList)`<PlcVariable* prev><
                            IntName intName><Numeric number>_0 : INT ; (*<CommentContent comment0>*)<NewLine nl><
                            IntName intName><Numeric number>_1 : INT ; (*<CommentContent comment1>*)<NewLine nl><
                            IntName intName><Numeric number>_2 : INT ; (*<CommentContent comment2>*)<NewLine nl><
                            IntName intName><Numeric number>_3 : INT ; (*<CommentContent comment3>*)<NewLine nl><
                            PlcVariable* rest>`:
    {
      debugPrint("Plc variable found: <intName>_<number>");
      debugPrint("Comment1: <comment0>");
      debugPrint("Comment2: <comment1>");
      debugPrint("Comment3: <comment2>");
      debugPrint("Comment4: <comment3>");
      textual = parse(#Name, "<trim("<intName>")>_<trim("<number>")>");      
      comment = parse(#DeclarationAndComment, " : INT ; (* <trim("<comment0>")> - <trim("<comment1>")> - <trim("<comment2>")> - <trim("<comment3>")> *)");
      insert((PlcVariableList)`<PlcVariable* prev><TextualName textual><DeclarationAndComment comment><PlcVariable* rest>`);
    }  
    
    // Array of Booleans
    case (PlcVariableList)`<PlcVariable *prev><
                           UpperCaseChars name>_<Numeric number><DeclarationAndComment details><
                           PlcVariable *next>`:
    {
      debugPrint("Array start: <name>");
      firstIndex = parseInt(number);   
      debugPrint("First index: <firstIndex>");   
      actualIndex = firstIndex+1;
      nextIndex = parse(#Numeric, "<actualIndex>");
      while( (PlcVariableList)`<UpperCaseChars name>_<Numeric number><DeclarationAndComment details><PlcVariable *newNext>` := (PlcVariableList)`<PlcVariable *next>`)
      {
        next = newNext;
        actualIndex += 1;
        nextIndex = parse(#Numeric, "<actualIndex>");       
      }
      arrayType = "NONE";
      visit(details)
      {
        case Type theType:
        {
          debugPrint("Type: <theType>");
          arrayType = trim("<theType>");
        }
        default:
        {
          ;
        }
      }      
      stringToParse = "<name>_<firstIndex>_<actualIndex> : ARRAY[<firstIndex>..<actualIndex>] OF <arrayType> ; (* Extracted aray *)";
      debugPrint("Array lay-out: <stringToParse>");
      array = parse(#PlcArray, stringToParse) ; 
      insert((PlcVariableList)`<PlcVariable *prev><PlcArray array><PlcVariable *next>`);      
    }    
  };
  renderParsetree(variableTree);
  variables = [];
  visit(variableTree)
  {
    case PlcVariable Var:
    {
      variables += trim("<Var>");
    }
  }
  return variables; 
}


Tree parseVariables(SymbolTable symbols) = parseVariables(convertSymbols(symbols));
Tree parseVariables(Variables variables)
{
  totalText = joinList(variables);
  writeFile(generatedFile("lastVarParser.symText"), totalText);
  return parse(#start[CodesysVariables], totalText);  
}

Variables convertSymbols(SymbolTable symbols) = [ extractVariable(plcSymbol) | plcSymbol <- symbols ];

str extractVariable(Symbol plcSymbol)
{
  dataType = plcSymbol.dataType;
  if("" == dataType)
  {
    dataType = typeString(plcSymbol.address);
  }  
  suffix = "; (* <plcSymbol.address> <plcSymbol.comment> *)";
  return "  <formatName(plcSymbol.name)> : <dataType> <suffix>";
}

str formatName(str variableName) = trim(replaceAll(replaceAll(replaceAll(variableName, ",", "_"), ".", "_"), "__", "_"));
str typeString(str address) = contains(address, ".") ? "BOOL" : "INT" ;
