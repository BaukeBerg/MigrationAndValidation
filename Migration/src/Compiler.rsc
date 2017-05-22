module Compiler

import FileLocations;
import IO;
import LabelHandler;
import List;
import Parser;
import PC20Syntax;
import Prelude;
import String;
import SymbolTable;

import utility::Debugging;
import utility::FileUtility;
import utility::ListUtility;
import utility::MathUtility;
import utility::StringUtility;

alias CompiledData = tuple[list[str] compiledLines, LabelList labels];
alias CompiledSourceData = tuple[CompiledData compiledData, list[str] sourceInfo];
alias InstructionList = tuple[list[str] compiledLines, list[str] sourceInfo];

void compilePds() = compileToFile("DR_TOT_3");
void compileToFile(str file) = writeToFile(generatedFile("<file>.compiled"),compile(file).compiledLines);

private bool printCompileInfo = true;
private bool printHandlingStatements = false;
private int nopLength = 15;
private int compiledStringLength = 24;

// Compile and glue back original input
CompiledData compileWithSourcesToFile(str sourceFile, symbolTable symbols)
{ 
  compiledData = compileWithSources(sourceFile, symbols) ;
  writeToFile(generatedFile("<sourceFile>.compiled"), compiledData.compiledLines);
  return compiledData;
}

// Compile with storing of original input
CompiledData compileWithSources(str sourceFile, symbolTable symbols)
{
  totalData = compile(sourceFile, symbols);
  totalData.compiledLines = insertSources(totalData.compiledLines, sourceFile);  
  return totalData;
}

list[str] insertSources(list[str] compiledLines, str inputFile)
{
  inputData = readFileLines(testFile(inputFile));
  processedLine = -1;
  for(n <- [0..size(compiledLines)])
  {
    compiledLine = getSourceLineNumber(compiledLines[n]);
    if(processedLine != compiledLine)
    {
      compiledLines[n] += inputData[compiledLine-1];
      processedLine = compiledLine;
    } 
  }
  return compiledLines;  
}

// Compile without storing orignal input
CompiledData compile(str file) = compile("<file>", "DR_TOT_3.SYM");
CompiledData compile(str sourceFile, str symbolTableFile) = compile(sourceFile, loadSymbols(symbolTableFile));
CompiledData compile(str sourceFile, symbolTable symbols)
{  
  LabelList labels = [];
  progCounter = 0;
  lineCounter = 1;
  lastLine = 1;
  compiledLines = [];
  debugPrint("Visiting ast");
  visit(generateSourceTree(sourceFile))
  {
    case NewLine N:
    {
      lineNumber = getLineNumber(N);
      if(lastLine == getLineNumber(N))
      {
        debugPrint("Handling newline", printHandlingStatements);  
        compiledLines += formatLine(lineCounter);
        lineCounter += 1;  
        lastLine = lineCounter;
      }
      else
      {
        debugPrint("Skipping newline @ line <lineNumber>", printHandlingStatements);
      }      
    }
    case SingleLabel L:
    {
      debugPrint("Handling single label <L>", printHandlingStatements);
      labels += composeLabel("<L>", progCounter); 
    }
    case Instruction I:
    {     
      debugPrint("Handling <I>, line count <lineCounter>, prog count <progCounter>", printHandlingStatements); 
      instructions = handleInstruction(I, lineCounter, progCounter, symbols);
      progCounter += size(instructions);
      lineCounter += 1;
      compiledLines += instructions;         
      lastLine = lineCounter;
    }
    case PdsComment C:
    {
      lineNumber = getLineNumber(C);
      if(lastLine == lineNumber)
      {
        debugPrint("Handling pds comment <C>, line count <lineCounter>, prog count <progCounter>", printHandlingStatements);
        compiledLines += formatLine(lineCounter);        
        lineCounter+=1;
        lastLine = lineCounter;
      }
      else
      {
        debugPrint("Skipping comment, line number <lineNumber> already occupied", printHandlingStatements);              
      }      
    }  
      
  }  
  debugPrint("First compilation stage completed", printCompileInfo);  
  return insertJumps(<compiledLines, sort(labels)>);  
}

CompiledData insertJumps(CompiledData firstStageData)
{
  compiledLines = firstStageData.compiledLines;  
  for(n <- [0 .. size(compiledLines)], isJump(compiledLines[n]))
  {
    programLine = getProgramLine(compiledLines[n]);    
    str label = labelName(compiledLines[n]);
    labelLine = getProgramLine(firstStageData.labels, label);
    if(startsWith(label, "L"))
    {
      switch(instructionNumber(compiledLines[n]))
      {
        case 24:
        {
          compiledLines[n] = replaceLabel(compiledLines[n], format(labelLine));
        }
        case 25:
        {
          compiledLines[n] = replaceLabel(compiledLines[n], format(labelLine));
        }
        case 29:
        {
          compiledLines[n] = replaceLabel(compiledLines[n], format(programLine - labelLine));
        }
        case 30:
        {
          compiledLines[n] = replaceLabel(compiledLines[n], format(labelLine - programLine));
        }   
      }
    }    
  }
  return <compiledLines, firstStageData.labels>;
}

bool isJump(str compiledLine) = isRelativeJump(compiledLine) || isAbsoluteJump(compiledLine);

bool isRelativeJump(str compiledLine) = inLimits(29, instructionNumber(compiledLine), 30);
bool isAbsoluteJump(str compiledLine) = inLimits(24, instructionNumber(compiledLine), 25);

int instructionNumber(str compiledLine)
{
  if(14 < size(compiledLine)) 
  {
    return parseInt(substring(compiledLine, 12,14));    
  }
  return -1;
}

int getProgramLine(str compiledLine)
{
  if(11 < size(compiledLine))
  {
    return parseInt(substring(compiledLine,6,11));    
  }
  return -1;
}

int getSourceLineNumber(str compiledLine)
{
  spacePos = findFirst(compiledLine, " ");
  if(-1 != spacePos)
  {
    return parseInt(substring(compiledLine, 0, spacePos));
  }
  return parseInt(compiledLine);
}

int getLineNumber(&T item) = item@\loc.begin.line;

list[str] handleNop(Tree I, int lineNumber, int progCounter)
{
  visit(I)
  {
    case Amount A:
    {
      debugPrint("Found <A> Nops", printCompileInfo);
      return handleNop(toInt(trim("<A>")), lineNumber, progCounter);      
    }
  }
  return handleNop(1, lineNumber, progCounter);  
}

str replaceLabel(str compiledLine, str replacedJump) = padLength(substring(compiledLine, 0, 15) + replacedJump, compiledStringLength); 

str labelName(str compiledLine)
{
  characterPos = findLast(compiledLine, "L");
  if(0 < characterPos)
  {
    return trim(substring(compiledLine, characterPos));
  }
  return jumpDestination(compiledLine);      
}

str jumpDestination(str compiledLine)
{
  compiledLine = trim(compiledLine);
  lastSpacePos = findLast(compiledLine, " ");
  if(0 < lastSpacePos)
  {
    return trim(substring(compiledLine, lastSpacePos));
  }
  return "ERROR";
}

list[str] handleNop(int amount, int lineNumber, int progCounter)
{
  list[str] instructions = [formatLine(lineNumber, progCounter, compiledStringLength)];  
  for(n <- [1 .. amount])
  {
    progCounter += 1;    
    instructions += formatLine(lineNumber, progCounter, nopLength);    
  }  
  return instructions;
}

list[str] handleInstruction(&T I, int lineNumber, int progCounter, symbolTable table)
{
  instruction = -1;
  address = ""; 
  debugPrint("Handling line number <lineNumber>, Instruction <I>", printHandlingStatements);
  visit(I)
  {
    case IdentifierInstructionName I:
    { 
      instruction = instructionNumber(I);
    }          
    case AmountInstructionName A:
    { 
      debugPrint("Handling amount instruction <A>");
      instruction = instructionNumber(A);      
    }
    case LabelInstructionName L:
    {
      debugPrint("Handling label instruction <L>");      
      instruction = instructionNumber(L);      
    }
    case Label L:
    {
      address = "<L>";
    }
    case ProgramLine P:
    {
      address = "<P>";
    }
    case NopInstruction N:
    {
      return handleNop(I, lineNumber, progCounter);
    }
    case PlainInstruction P:
    {
      instruction = 26;
      return [formatLine(lineNumber, progCounter, instruction, "     ")];
    }
    case Variable V:
    {    
      address = convertVariable(V, table);
    }
    case Address A:
    {
      address = trim("<A>");
    }    
    case Amount A:
    {
      address = trim("<A>");
    }
  }  
  str returnLine = formatLine(lineNumber, progCounter, instruction, format(address, 5));
  println(returnLine);  
  return [returnLine];   
}

str convertVariable(Variable V, symbolTable table)
{
  for(symbol <- table, trim("<V>") == symbol.name)
  {
    return symbol.address;
  }
  return UnknownIdentifier(V);
}

str formatLine(int lineNumber) = padLength(format(lineNumber), compiledStringLength);
str formatLine(int lineNumber, int progCounter, int desiredLength) = padLength("<format(lineNumber)> <format(progCounter)> 00", desiredLength);
str formatLine(int lineNumber, int progCounter, int instruction, str address) = padLength("<format(lineNumber)> <format(progCounter)> <format(instruction, 2)> <format(address,5)>", compiledStringLength);
str padLength(str inputString, int outputSize) = left(inputString, outputSize, " ");
str format(int numericValue) = format(numericValue, 5);
str format(int numericValue, int stringSize) = format("<numericValue>", stringSize);
str format(str stringValue, int stringSize) = contains(stringValue, ".") ? right(stringValue, stringSize+2, "0") : right(stringValue, stringSize, "0") ;

int instructionNumber(LabelInstructionName name)
{
  switch(name)
  {
    case (LabelInstructionName)`JSAF`: return 24;
    case (LabelInstructionName)`JSAT`: return 25;    
    case (LabelInstructionName)`JBRF`: return 29;
    case (LabelInstructionName)`JFRF`: return 30;         
  }
  return UnknownInstruction("Label: <name>");
}

int instructionNumber(AmountInstructionName name)
{
  switch(name)
  {
    case (AmountInstructionName)`FTCHC`: return 12;
  }
  return UnknownInstruction("Amount: <name>");
}

int instructionNumber(IdentifierInstructionName name)
{
  switch(name)
  {  
    case (IdentifierInstructionName)`TRIG`: return 1;
    case (IdentifierInstructionName)`EQL`: return 2;
    case (IdentifierInstructionName)`EQLNT`: return 3;
    case (IdentifierInstructionName)`SHFTL`: return 4;
    case (IdentifierInstructionName)`SHFTR`: return 5;
    case (IdentifierInstructionName)`CNTD`: return 6;
    case (IdentifierInstructionName)`CNTU`: return 7;
    case (IdentifierInstructionName)`SET0`: return 8;
    case (IdentifierInstructionName)`SET1`: return 9;
    case (IdentifierInstructionName)`STRB`: return 10;
    case (IdentifierInstructionName)`FTCHB`: return 11;
    
    case (IdentifierInstructionName)`FTCHD`: return 13;
    case (IdentifierInstructionName)`STRD`: return 14;
    case (IdentifierInstructionName)`COMP`: return 15;
    case (IdentifierInstructionName)`AND`: return 16;
    case (IdentifierInstructionName)`ANDNT`: return 17;
    case (IdentifierInstructionName)`OR`: return 18;
    case (IdentifierInstructionName)`ORNT`: return 19;
    case (IdentifierInstructionName)`ADD`: return 20;
    case (IdentifierInstructionName)`SUBTR`: return 21;
    case (IdentifierInstructionName)`MULT`: return 22;
    case (IdentifierInstructionName)`DIV`: return 23;
    
    case (IdentifierInstructionName)`END`: return 27;    
    case (IdentifierInstructionName)`LSTIO`: return 31;
  }
  return UnknownInstruction("Identifier: <name>");
}

int UnknownInstruction(&T instruction)
{
  println("Unknown Instruction: <instruction>");
  return -1;
}

str convertIdentifier(Identifier I)
{
  switch(I)
  {
    case BitAddress B: return "<B>";
    case WordAddress W: "<W>";
    case Variable V: return lookup("<V>");
  }
  return UnknownIdentifier(I);  
}

str lookup(Variable V)
{
  try{
    return symbolTable.indexOf("<V>");
  }
  catch:
  {
    return UnknownIdentifier(V);
  };    
}

str UnknownIdentifier(&T identifier)
{
  println("Unknown Identifier: <identifier>");
  return "UNKNOWN-IDENTIFIER";
}
