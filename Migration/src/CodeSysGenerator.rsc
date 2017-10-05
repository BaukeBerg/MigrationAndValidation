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

void generateFile(str outputPath, Tree plcModel, SymbolTable symbols)
{
  PlcProgram program = extractInformation(plcModel, symbols);
  generateProgram(outputPath, program);
}

PlcProgram extractInformation(Tree plcModel, SymbolTable symbols)
{
  programLines = [];
  Variables variableList = convertSymbols(symbols);
  variableList = simplifyVariables(variableList);
  variableList += "\r\n(* Local variables generated by Rascal *)";
  visit(plcModel)
  {
    case AssignConstant A:
    {
      programLines += extractStatements(A, symbols);
    }
    
    case BitTrigger B:
    {
      <declaration, statements> = evaluateTrigger(B, symbols);
      variableList += declaration;
      programLines += statements;
    }
    
  }
  return <variableList,programLines>;
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
  
  statements += formatName(variableInfo.name);
  statements += "(";
  statements += "  CLK := <trim("<logicExpression>")>, <formatComment(logicExpression, symbols)>";
  statements += "  Q =\> <retrieveVariableName(variableInfo.address, symbols)>, (* <retrieveComment(variableInfo.address, symbols)> *)";
  statements += ");";
  statements += "  "; 
  return <extractVariable(variableInfo), statements>;
}

Statements extractStatements(AssignConstant A, SymbolTable symbols)
{
  constantValue = -1;
  statements = ["(* <A> *)"];
  addresses = [];
  debugPrint("Generating asssing <A>");
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
  return statements;
}

str formatComment(LogicExpression logicExpression, SymbolTable symbols)
{
  addresses = [];
  visit(logicExpression)
  {
    case BitAddress BA:
    {
      addresses += ["<BA>"];
    }
  }
  commentString = "(* ";
  for(address <- addresses)
  {
    commentString += debugPrint("finding data for <address>:","<trim(retrieveComment(address, symbols))> ");    
  }
  return commentString + "*)";
  
}

Statements evaluateAssign(SymbolTable symbols, str address, int constantValue)
{
  if(true == isBoolean(address, symbols))
  {
    Statements statements = [];
    for(bitAddress <- retrieveAddressList(address, symbols))
    {
      variableName = retrieveVariableName(bitAddress, symbols);
      println(variableName);
      statements += "<variableName> := <getBit(constantValue, lastInteger(bitAddress))> ; (* <retrieveComment(variableName, symbols)> *)";
    }
    return statements;
  }
  return ["<address> := <constantValue> ;"];
}

void generateProgram(str outputPath, PlcProgram program) = writeToFile(generatedFile(outputPath), generateOutput(program));
list[str] generateOutput(PlcProgram program)
{
  totalFile = ["PROGRAM PLC_PRG", "VAR"];
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
  return parseText(totalText, #start[CodesysVariables]);  
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
 

 
 