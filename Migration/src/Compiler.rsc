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

private int nopLength = 15;
private int compiledStringLength = 24;


CompiledData compile(str file) = compile("<file>.PRG", "<file>.SYM");
CompiledData compile(str sourceFile, str symbolTableFile)
{
  LabelList labels = [];
  debugPrint("Generating symbol table");
  symbolTable = generateSymbolTable(symbolTableFile);  
  progCounter = 0;
  lineCounter = 0;
  compiledLines = [];
  debugPrint("Visiting ast");
  visit(generateSourceTree(sourceFile))
  {
    case SingleLabel L:
    {
      labels += composeLabel("<L>", progCounter); 
    }
    case Instruction I:
    {
      println("Handling instruction: <lineCounter>, <progCounter>" );
      compiledLines += handleInstruction(I, lineCounter, progCounter, symbolTable);
      progCounter += 1 ;
      lineCounter += 1;
    }      
  }  
  debugPrint("Handled!");
  return <compiledLines, labels>;
    
}

list[str] handleNop(int amount, int lineNumber, int progCounter)
{
  list[str] compiledLines = [];
  for(n <- [0 .. amount])
  {
    compiledLines += formatLine(lineNumber, progCounter);
    lineNumber += 1 ;
    progCounter += 1;
  }
  return compiledLines;
}

str handleInstruction(&T I, int lineNumber, int progCounter, symbolTable table)
{
  instruction = -1;
  address = "";  
  visit(I)
  {
    case IdentifierInstructionName I: 
      instruction = instructionNumber(I);          
    case AmountInstructionName A: 
      instruction = instructionNumber(A);
    case LabelInstructionName L: 
      instruction = instructionNumber(L);
    case NopInstruction N:
      instruction = 0;
    case PlainInstruction P:
      instruction = 26;
    case Variable V:    
      address = convertVariable(V, table);
    case Address A:
      address = trim("<A>");    
  }  
  return formatLine(lineNumber, progCounter, instruction, format(address, 5));   
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
    case (LabelInstructionName)`JSAF`: return 29;
    case (LabelInstructionName)`JSAT`: return 30;    
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
