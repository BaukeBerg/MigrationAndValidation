module Compiler

import FileLocations;
import IO;
import List;
import Parser;
import PC20Syntax;
import Prelude;
import String;

import utility::StringUtility;

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
    case label L:
    {
      storeLabel(L);
    }  
    case PdsComment C:
    {
      handleComment(C);
    } 
    case Instruction I:
    { 
      handleInstruction(I);
    }
    case Variable V:
    {
      substitute(V);
    }
  }
  iprintln(compiledLines);  
}

void resetData()
{
  lineCounter = 0;
  progCounter = 0;  
  labels = ("":"");
  compiledLines = [];  
}

void storeLabel(Label L)
{
  ;
  //  println("Label: <L>, line: <convertLine(progCounter)>");
  //  labels += ("<L>": convertLine(progCounter));
}

void handleComment(PdsComment C, compiledLines)
{
  compiledLines += formatLine(lineCounter, "", "<C>\r\n");
  lineCounter += 1;
  return compiledLines;
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

void handleInstruction(Instruction I)
{
  ;//iprintln(I);
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



