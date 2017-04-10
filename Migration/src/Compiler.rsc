module compiler

import IO;
import locations;
import Parser;
import PC20Syntax;
import Prelude;
import string;

//alias labelList = map[str label, int lineNumber];
map[str label, str lineNumber] labels;

int lineCounter = 0;
int progCounter = 0;
list[str] compiledLines = [];

void compilePds() = compile("DR_TOT_3.PRG");

void compile(str fileName)
{
  resetData();
  tree = visit(doParse(fileName))
  {
    case label l:
    {
      storeLabel(L);
    }  
    case PdsComment c:
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

void storeLabel((Label) l)
{
//  println("Label: <L>, line: <convertLine(progCounter)>");
//  labels += ("<L>": convertLine(progCounter));
}

void handleComment(PdsComment c)
{
  handleLine(lineCounter, "", "<C>\r\n");
  lineCounter += 1;
} 

void handleInstruction(Instruction I)
{
  ;//iprintln(I);
}

void handleLine(int lineNumber, int progCounter, int instruction, int address)
{
  compiledLines += "<convertLine(lineNumber)> <instruction>\t<input>";
}


void handleLine(int lineNumber, int progCounter, int instruction, real address)
{
  compiledLines += "<format(lineNumber)> <format(progCounter)> <format(instruction, 2)> <format(address)>\t";
}

test bool testFormat()
{
  return 
}

str format(real realValue)
{
  list[str] addressData = split(".", "<realValue>");
  return format(addressData[0], addressData[1]);  
}

str format(str address, str bitAddress) = "<format(toInt(address),5)>.<format(toInt(bitAddress),1)>"; 

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



