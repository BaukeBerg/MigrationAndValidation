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
import utility::StringUtility;

alias CompiledData = tuple[list[str] compiledLines, LabelList labels];

void compilePds() = compileToFile("DR_TOT_3");
void compileToFile(str file) = writeToFile(generatedFile("<file>.compiled"),compile(file).compiledLines);

private bool printCompileInfo = true;
private int nopLength = 15;
private int compiledStringLength = 24;

CompiledData compile(str file) = compile("<file>", loadSymbols("DR_TOT_3.SYM"));
CompiledData compile(str sourceFile, str symbolTableFile) = compile(sourceFile, generateSymbolTable(symbolTableFile));
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
        debugPrint("Handling newline");  
        compiledLines += formatLine(lineCounter);        
        lineCounter += 1;  
        lastLine = lineCounter;
      }
      else
      {
        debugPrint("skipping newline @ line <lineNumber>");
      }      
    }
    case SingleLabel L:
    {
      debugPrint("Handling single label <L>");
      labels += composeLabel("<L>", progCounter); 
    }
    case Instruction I:
    {     
      debugPrint("handling <I>, line count <lineCounter>, prog count <progCounter>"); 
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
        debugPrint("Handling pds comment <C>, line count <lineCounter>, prog count <progCounter>");
        compiledLines += formatLine(lineCounter);        
        lineCounter+=1;
        lastLine = lineCounter;
      }
      else
      {
        debugPrint("Skipping comment, line number <lineNumber> already occupied");
      }
    }    
  }  
  debugPrint("Handled!", printCompileInfo);
  writeToFile(generatedFile("compiledData.compile"), compiledLines);
  return <compiledLines, sort(labels)>;    
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

list[str] handleNop(int amount, int lineNumber, int progCounter)
{
  list[str] instructions = [];
  for(n <- [0 .. amount])
  {
    instructions += formatLine(lineNumber, progCounter);    
    progCounter += 1;    
  }  
  return instructions;
}

list[str] handleInstruction(&T I, int lineNumber, int progCounter, symbolTable table)
{
  instruction = -1;
  address = ""; 
  debugPrint("Handling line number <lineNumber>, Instruction <I>");
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
      /// TODO: Fix this => now simply cuts the L
      /// Perhaps Post process all L.... by replacing them?
      /// Perhaps do a pre-visit to collect all labels?
      address = substring("<L>",1);
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
      /// TODO: Handle RET instructions better
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
str formatLine(int lineNumber, int progCounter)  = padLength("<format(lineNumber)> <format(progCounter)> 00", nopLength);
str formatLine(int lineNumber, int progCounter, int instruction, str address) = padLength("<format(lineNumber)> <format(progCounter)> <format(instruction, 2)> <format(address,5)>", compiledStringLength);
str padLength(str inputString, int outputSize) = left(inputString, outputSize, " ");
str format(int numericValue) = format(numericValue, 5);
str format(int numericValue, int stringSize) = format("<numericValue>", stringSize);
str format(str stringValue, int stringSize) = contains(stringValue, ".") ? right(stringValue, stringSize+2, "0") : right(stringValue, stringSize, "0") ;

void substitute(Variable V)
{
  str varName = trim("<V>");
  try
  {
    println(labels[varName]);
  }
  catch:
  {
    ;//println("No such key: <varName>");
  }
}

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
