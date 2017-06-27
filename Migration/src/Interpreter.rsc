module Interpreter

import FileLocations;
import IO;
import List;
import String;

import utility::Debugging;
import utility::StringUtility;

int programCounter = 0 ;
list[str] instructionList = readFileLines(generatedFile("DR_TOT_3.instructions"));
list[int] scratchPad = [];

void reset()
{
 programCounter = 0;
 for(n <- [0 .. size(scratchPad)])
 {
  scratchPad[n] = 0;  
 }
}

bool queryAddress(int address, int bit)
{
  int address = scratchpad[address];
  maskValue = shiftLeft(1, bit);
  return mask(address, mask);
}

void handleInstruction()
{
  currentInstruction = instructionList[programCounter];
  programCounter+=1;  
  instructionNumber = parseInt(substring(currentInstruction, 0, 2));
  addressData = trim(substring(currentInstruction, 2));
  debugPrint("Handling instruction <instructionNumber> with data: <addressData>");  
  switch(instructionNumber)
  {
    case 0:
    {
      ;
    }
    case 1:
    {
      ;
    }
    case 2:
    {
      ;
    }
    case 3:
    {
      ;
    }
    case 4:
    {
      ;
    }
    case 5:
    {
      ;
    }
    case 6:
    {
      ;
    }
    case 7:
    {
      ;
    }
    case 8:
    {
      ;
    }
    case 9:
    {
      ;
    }
    case 10:
    {
      ;
    }
    case 11:
    {
      ;
    }
    case 12:
    {
      ;
    }
    case 13:
    {
      ;
    }
    case 14:
    {
      ;
    }
    case 15:
    {
      ;
    }
    case 16:
    {
      ;
    }
    case 17:
    {
      ;
    }
    case 18:
    {
      ;
    }
    case 19:
    {
      ;
    }
    case 20:
    {
      ;
    }
    case 21:
    {
      ;
    }
    case 22:
    {
      ;
    }
    case 23:
    {
      ;
    }
    case 24:
    {
      ;
    }
    case 25:
    {
      ;
    }
    case 26:
    {
      ;
    }
    case 27:
    {
      ;
    }
    case 28:
    {
      ;
    }
    case 29:
    {
      ;
    }
    case 30:
    {
      ;
    }
    case 31:
    {
      ;
    }  
  }
}