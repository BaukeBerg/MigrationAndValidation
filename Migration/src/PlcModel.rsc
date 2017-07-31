module PlcModel

import DataTypes;
import IO;
import List;

import utility::ListUtility;

public Model DR_TOT_3 = [];

void addLogicBlock(LogicBlock newBlock)
{
  newBlock.conditions = trimList(newBlock.conditions);
  newBlock.actions = trimList(newBlock.actions);
  iprintln(newBlock);
  DR_TOT_3 += [newBlock];
}