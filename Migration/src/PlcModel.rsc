module PlcModel

import IO;
import List;

import utility::ListUtility;

alias Model = list[LogicBlock];
alias LogicBlock = tuple[SourceRange range, str name, list[Statement] conditions, list[Statement] actions];
alias SourceRange = tuple[int firstLine, int lastLine];
alias Statement = str;

public Model DR_TOT_3 = [];

void addLogicBlock(LogicBlock newBlock)
{
  newBlock.conditions = trimList(newBlock.conditions);
  newBlock.actions = trimList(newBlock.actions);
  iprintln(newBlock);
  DR_TOT_3 += [newBlock];
}