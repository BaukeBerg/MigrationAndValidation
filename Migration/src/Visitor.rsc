module Visitor

import IO;
import Locations;
import Parser;
import PC20Syntax;
import Prelude;
import String;

//alias labelList = map[str label, int lineNumber];
map[str label, str lineNumber] labels;
int progCounter = 0;

void compile(str fileName)
{
  progCounter = 0;  
  labels = ("":"");
  Tree = visit(doParse(fileName))
  {
    case Label L:
    {
      storeLabel(L);
    }  
    case PdsComment C:
    {
      handleComment(C);
    } 
    case Instruction I:
    {
      progCounter += 1;
      handleInstruction(I);
    }
    case Variable V:
    {
      substitute(V);
    }
  }
  println(labels);
  
}

void createSourceFile()
{
  ; 
}

void storeLabel((Label) L)
{
  println("Label: <L>, Line: <convertLine(progCounter)>");
  labels += ("<L>": convertLine(progCounter));
}

void handleComment(PdsComment C) {;} // println(C);

void handleInstruction(Instruction I) {;} //println(I);

str convertLine(int progCount)
{
  str count = "<progCount>";
  while(5 > size(count))
  {
    count = "0" + count;
  }
  return count;  
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
