module PlcModel

import IO;
import List;

import utility::ListUtility;

alias Model = list[LogicBlock];
alias LogicBlock = tuple[str name, list[Statement] instructions];
alias Statement = str;

public Model DR_TOT_3 = [];

void addLogicBlock(LogicBlock newBlock)
{
  newBlock.instructions = trimList(newBlock.instructions);
  iprintln(newBlock);
  DR_TOT_3 += [newBlock];
}