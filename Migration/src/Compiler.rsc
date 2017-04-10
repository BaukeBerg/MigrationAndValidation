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
      instruction = instructionNumber(A);      
    case AmountInstructionName A:
      instruction = instructionNumber(A);
    case LabelInstructionName A:
      instruction = instructionNumber(A);    
    case NOP:
      instruction = 0;
    case RET:
      instruction = 26;
  }
  return formattedLine = formatLine(lineNumber, progCounter, instruction, 0); 
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
    case JSAF: return 24;
    case JSAT: return 25;
    case JBRF: return 29;
    case JFRF: return 30; 
    default: iprintln("Unknown instruction: <name>");       
  }   
  return -1;
}

int instructionNumber(IdentifierInstructionName name)
{
  switch(name)
  {
    case TRIG: return 1;
    case EQL: return 2;
    case EQLNT: return 3;
    case SHFTL: return 4;
    case SHFTR: return 5;
    case CNTD: return 6;
    case CNTU: return 7;
    case SET0: return 8;
    case SET1: return 9;
    case STRB: return 10;
    case FTCHB: return 11;
    case FTCHC: return 12;
    case FTCHD: return 13;
    case STRD: return 14;
    case COMP: return 15;
    case AND: return 16;
    case ANDNT: return 17;
    case OR: return 18;
    case ORNT: return 19;
    case ADD: return 20;
    case SUBTR: return 21;
    case MULT: return 22;
    case DIV: return 23;
    case RET: return 26;
    case END: return 27;    
    case JBRF: return 29;
    case JFRF: return 30;
    case LSTIO: return 31;
    default: iprintln("Unknown instruction: <name>");
  }
  return -1;
}

