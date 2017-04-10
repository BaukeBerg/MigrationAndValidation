module Compiler

import FileLocations;
import IO;
import List;
import Parser;
import PC20Syntax;
import Prelude;
import String;

import utility::StringUtility;
import utility::FileUtility;

map[str label, str lineNumber] labels;

private int compiledStringLength = 24;

int lineCounter = 0;
int progCounter = 0;
list[str] compiledLines = [];

void compilePds() = compile("DR_TOT_3.PRG");

void compile(str fileName)
{
  resetData();
  tree = visit(doParse(fileName))
  {
    case Label L:
    {
      ;
    }  
    case PdsComment C:
    {
      compiledLines += formatLine(lineCounter);
      lineCounter +=1;
    } 
    case IdentifierInstruction I:
    {
      compiledLines += handleInstruction(I, lineCounter, progCounter);      
      lineCounter += 1;
      progCounter += 1;      
    }
    case Variable V:
    {
      substitute(V);
    }
  }
  addToFile(generatedFile("compiledData"),compiledLines);  
}

void resetData()
{
  lineCounter = 0;
  progCounter = 0;  
  labels = ("":"");
  compiledLines = [];  
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

str handleInstruction(IdentifierInstruction I, int lineNumber, int progCounter)
{
  int instruction = -1;
  visit(I)
  {
    case IdentifierInstructionName A:
    {
      instruction = instructionNumber(A);
    }      
    case AmountInstructionName A:
    {
      instruction = instructionNumber(A);
    }
    case LabelInstructionName A:
      instruction = instructionNumber(A);    
    case NOP:
      instruction = 0;
    case RET:
      instruction = 26;
  }
  println(instruction);
  return formatLine(lineNumber, progCounter, instruction, 0); 
}

str formatLine(int lineNumber) = padLength(format(lineNumber));
str formatLine(int lineNumber, int progCounter)  = padLength("<format(lineNumber)> <format(progCounter)> 00");
str formatLine(int lineNumber, int progCounter, int instruction, &T address) = padLength("<format(lineNumber)> <format(progCounter)> <format(instruction, 2)> <format(address)>");
str padLength(str inputString) = padString(inputString, " ", compiledStringLength);

str format(real realValue) = format(split(".", "<realValue>"));
str format(list[str] addressData) = "<format(toInt(addressData[0]),5)>.<format(toInt(addressData[1]),1)>"; 
str format(int numericValue) = format(numericValue, 5);
str format(int numericValue, int stringSize)
{
  str number = "<numericValue>";
  while(stringSize > size(number))
  {
    number = "0" + number;
  }
  return number;  
}

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
    case (LabelInstructionName)`JSAF`: instruction = 29;
    case (LabelInstructionName)`JSAT`: instruction = 30;    
    case (LabelInstructionName)`JBRF`: instruction = 29;
    case (LabelInstructionName)`JFRF`: instruction = 30;
    default: iprintln("Unknown instruction: <name>");       
  }   
  return -1;
}

int instructionNumber(AmountInstructionName name)
{
  switch(name)
  {
    case (AmountInstructionName)`FTCHC`: instruction = 12;
  }
  return -1;
}

int instructionNumber(IdentifierInstructionName name)
{
  println(name);
  instruction = -1;
  switch(name)
  {
  
    case (IdentifierInstructionName)`TRIG`: return 1;
    case (IdentifierInstructionName)`EQL`: return 2;
    case (IdentifierInstructionName)`EQLNT`: instruction = 3;
    case (IdentifierInstructionName)`SHFTL`: instruction = 4;
    case (IdentifierInstructionName)`SHFTR`: instruction = 5;
    case (IdentifierInstructionName)`CNTD`: instruction = 6;
    case (IdentifierInstructionName)`CNTU`: instruction = 7;
    case (IdentifierInstructionName)`SET0`: instruction = 8;
    case (IdentifierInstructionName)`SET1`: instruction = 9;
    case (IdentifierInstructionName)`STRB`: instruction = 10;
    case (IdentifierInstructionName)`FTCHB`: instruction = 11;
    
    case (IdentifierInstructionName)`FTCHD`: return 13;
    case (IdentifierInstructionName)`STRD`: instruction = 14;
    case (IdentifierInstructionName)`COMP`: instruction = 15;
    case (IdentifierInstructionName)`AND`: return 16;
    case (IdentifierInstructionName)`ANDNT`: instruction = 17;
    case (IdentifierInstructionName)`OR`: instruction = 18;
    case (IdentifierInstructionName)`ORNT`: instruction = 19;
    case (IdentifierInstructionName)`ADD`: instruction = 20;
    case (IdentifierInstructionName)`SUBTR`: instruction = 21;
    case (IdentifierInstructionName)`MULT`: instruction = 22;
    case (IdentifierInstructionName)`DIV`: instruction = 23;
    
    case (IdentifierInstructionName)`END`: instruction = 27;    
    case (IdentifierInstructionName)`LSTIO`: instruction = 31;
    
    default: 
    {
      iprintln("Unknown instruction: <name>");
    }
  }
  println(instruction);
  return instruction;
}

