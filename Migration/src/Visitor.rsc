module Visitor

import IO;
import Parser;
import PC20Syntax;
import String;


void printDetails(str fileName)
{
  start [PC20] Tree = doParse(fileName);
  visit(Tree)
  {
    case Label L: 
      println("Label found: <L>");
    case PdsComment C: 
      println("Pds comment found: <C>");    
  }
}

void createSourceFile()
{
  ; 
}
