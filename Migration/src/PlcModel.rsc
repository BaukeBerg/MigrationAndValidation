module PlcModel

import List;

alias Model = list[LogicBlock];
alias LogicBlock = list[Statement];
alias Statement = str;

public Model DR_TOT_3 = [];

void addLogicBlock(LogicBlock newBlock)
{
  DR_TOT_3 += [newBlock];
}