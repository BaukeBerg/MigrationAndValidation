module PlcModel

import IO;
import List;

import utility::ListUtility;

alias Model = list[LogicBlock];
alias LogicBlock = tuple[int firstIndex, int lastIndex, str name, list[Statement] conditions, list[Statement] actions];
alias Statement = str;

public Model DR_TOT_3 = [];

void addLogicBlock(LogicBlock newBlock)
{
  newBlock.conditions = trimList(newBlock.conditions);
  newBlock.actions = trimList(newBlock.actions);
  iprintln(newBlock);
  DR_TOT_3 += [newBlock];
}