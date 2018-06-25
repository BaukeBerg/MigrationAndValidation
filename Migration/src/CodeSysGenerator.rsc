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
                                
void generateFile(str outputPath, Tree plcModel, SymbolTable symbols)
{
  PlcProgram program = extractInformation(plcModel, symbols);
  generateProgram(outputPath, program);
}

PlcProgram extractInformation(Tree plcModel, SymbolTable symbols)
{
  includedLines = 0;
  hasOpenCondition = false;
  programLines = [];
  endIfPositions = [];  
  Variables variableList = convertSymbols(symbols);
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
    
    case IfBlock IB:
    {
      programLines = houseKeeping(IB, endIfPositions, programLines);
      programLines += defaultFormat(IB)[1..];
      
      visit(IB)
      {
        case LogicExpression LE:
        {
          programLines += ["IF <evaluateExpression(LE, symbols)> THEN <formatComment(LE, symbols)>"];
        }
        case JumpSize JS:
        {
          endIfPositions += (parseInt(JS) + programCount(IB));
        }
      }
      includedLines += extractSize(IB);
    }
    
    case IOSynchronization IO:
    {
      programLines = houseKeeping(IO, endIfPositions, programLines);
      programLines += defaultFormat(IO);
    }
    
    case ExecuteInstruction EL:
    {
      programLines = houseKeeping(EL, endIfPositions, programLines);
      programLines += defaultFormat(EL);
    }
    
    case ConditionInstruction EL:
    {
      programLines = houseKeeping(EL, endIfPositions, programLines);
      programLines += defaultFormat(EL);
    }
    
    case SkipInstruction EL:
    {
      programLines = houseKeeping(EL, endIfPositions, programLines);
      programLines += defaultFormat(EL);
    }
    
    case IOInstruction EL:
    {
      programLines = houseKeeping(EL, endIfPositions, programLines);
      programLines += defaultFormat(EL);
    }
    
    case SingleInstruction EL:
    {
      programLines = houseKeeping(EL, endIfPositions, programLines);
      programLines += defaultFormat(EL);
    }
    
    case ConditionInstruction EL:
    {
      programLines = houseKeeping(EL, endIfPositions, programLines);
      programLines += defaultFormat(EL);
    }
    
    case Error EL:
    {
      programLines = houseKeeping(EL, endIfPositions, programLines);
      programLines += defaultFormat(EL);
    }  
    
    /// Composed instructions, used for pattern matching   
    case ReadValue EL:
    {
      programLines = houseKeeping(EL, endIfPositions, programLines);
      programLines += defaultFormat(EL);
    } 
    
    case WriteValue EL:
    {
      programLines = houseKeeping(EL, endIfPositions, programLines);
      programLines += defaultFormat(EL);
    } 
    
    case OtherBlock EL:
    {
      programLines = houseKeeping(EL, endIfPositions, programLines);
      programLines += defaultFormat(EL);
    }   
    
    case TriggerBlock EL:
    {
      programLines = houseKeeping(EL, endIfPositions, programLines);
      programLines += defaultFormat(EL);
    } 
    
    case AndEqual EL:      
    {
      programLines = houseKeeping(EL, endIfPositions, programLines);
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
      programLines = houseKeeping(EL, endIfPositions, programLines);
      programLines += defaultFormat(EL);
    }         
        
    case AssignConstant A:
    {
      programLines = houseKeeping(A, endIfPositions, programLines);
      includedLines += extractSize(A);      
      programLines += extractStatements(A, symbols);
    }
    
    case AssignValue A:
    {
      programLines = houseKeeping(A, endIfPositions, programLines);
      includedLines += extractSize(A);
      programLines += extractStatements(A, symbols);
    }
        
    case BitTrigger B:
    {
      programLines = houseKeeping(B, endIfPositions, programLines);
      includedLines += extractSize(B);
      <declaration, statements> = evaluateTrigger(B, symbols);
      variableList += declaration;
      programLines += statements;
    }
    
    case CompareValue CV:
    {
      actualProgramCount = programCount(CV);
      debugPrint("CompareValue");
      includedLines += extractSize(CV);
      programLines += extractStatements(CV, symbols);
    }
    
    case LogicCondition LC:
    {
      actualProgramCount = programCount(LC);    
      if(hasOpenCondition) 
      {
        programLines = closeIf(programLines);
        hasOpenCondition = false;        
      }
      includedLines += extractSize(LC);      
      visit(LC)
      {
        case LogicExpression LE:
        {
          programLines += ["(* <LC> *)", "IF <evaluateExpression(LE, symbols)> THEN <formatComment(LE, symbols)>"];
          hasOpenCondition = true;
        }
      }
    }
    
    case NopBlock NB:
    {
      actualProgramCount = programCount(NB);
      includedLines += extractSize(NB);
      programLines += ["(* <NB> *)", "; (* DoNothing *)", "  "];
    }
  }
  if(hasOpenCondition) 
  {
    programLines = closeIf(programLines);
    hasOpenCondition = false;        
  }
  debugPrint("Total line amount included: <includedLines>");
  return <variableList,programLines>;
}

Statements houseKeeping(&T item, list[int] endIfPositions, Statements currentProgram)
{
  if(programCount(item) in endIfPositions)
  {
    debugPrint("inserting IF-termination");
    return currentProgram + ["END_IF; "];
  }
  return currentProgram;
}

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
  if("  " == last(programLines))
  {
    programLines = delete(programLines, size(programLines)-1); 
  }        
  programSize = size(programLines);
  
  for(line <- [1..programSize])
  {
    if(startsWith(programLines[programSize-line], "IF "))
    {
      break;
    }
    else
    {
      programLines[programSize-line] = "  " + programLines[programSize-line];
    } 
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
    debugPrint("Scanning: <symbol.address>");
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

tuple[str declaration, list[str] statements] evaluateTrigger(BitTrigger B, SymbolTable symbols)
{
  Symbol variableInfo = <"", "", "", "R_TRIG">;
  statements = ["(* <B>*)"];
  variableName = "";
  LogicExpression logicExpression;
  visit(B)
  {
    case TriggerExpression TE:
    {
      visit(TE)
      {
        case TriggerResult TR:
        { 
          variableInfo.name = "TRIGGER_<TR>";
        }  
        case LogicExpression LE:
        {
          logicExpression = LE;          
        }
      }
    }
    case TriggerTarget TT:
    {
      variableInfo.address = "<TT>";
      variableName = retrieveVariableName(variableInfo.address, symbols);
      variableInfo.comment = variableName ;
    }
  }
  
  clkExp = evaluateExpression(logicExpression, symbols);
  statements += formatName(variableInfo.name);
  statements += "(";
  statements += "  CLK := <clkExp>, <formatComment(logicExpression, symbols)>";
  statements += "  Q =\> <retrieveVariableName(variableInfo.address, symbols)>, (* <retrieveComment(variableInfo.address, symbols)> *)";
  statements += ");";
  statements += "  "; 
  return <extractVariable(variableInfo), statements>;
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
  constantValue = -1;
  statements = ["(* <A> *)"];
  addresses = [];
  debugPrint("Generating assign <A>");
  visit(A)
  {
    case ConstantValue C:
    {
      constantValue = parseInt("<C>");     
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
  for(address <- addresses)
  {
    statements += evaluateAssign(symbols, address, constantValue);  
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
      println(variableName);
      statements += "<variableName> := <toUpperCase("<getBit(constantValue, lastInteger(bitAddress))>")> ; (* <retrieveComment(variableName, symbols)> *)";
    }    
    return statements;
  }
  else
  {
    debugPrint("Integer address <address>");
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

str formatName(str variableName) = trim(replaceAll(replaceAll(variableName, ",", "_"), ".", "_"));
str typeString(str address) = contains(address, ".") ? "BOOL" : "INT" ;
