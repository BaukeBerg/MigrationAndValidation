module Interpreter

import Boolean;
import FileLocations;
import IO;
import List;
import String;

import util::Math;

import utility::Debugging;
import utility::ListUtility;
import utility::MathUtility;
import utility::StringUtility;

alias Address = tuple[int index, int bit];
alias Register = tuple[list[bool] bit, int index];

int memorySize = 3000;

list[int] initScratchPad() = generateList(memorySize, 0);
int lastFetch = -10;
public int programCounter = 0 ;
list[str] instructionList = readFileLines(generatedFile("DR_TOT_3.instructions"));
list[int] scratchPad = initScratchPad();
list[int] triggerScratchPad = initScratchPad();
bool condition = false;
Register register = <generateList(16,false), 0>;

bool showInstructions = false;

void reset()
{
 lastFetch = -10;
 programCounter = 0;
 conddition = false;
 resetScratchPad();
}

void resetRegister()
{
  register = <generateList(16,false), 0>;
}
  

void resetScratchPad()
{
  scratchPad = initScratchPad();
  triggerScratchPad = initScratchPad();
}

void NOP()
{
  handlePrint("NOP");
}

// Specification of Trigger instruction
void TRIGGER(Address address)
{
  isTrue = GETBIT(address);
  wasTrue = getBit(triggerScratchPad[address.index], address.bit);
  triggerScratchPad[address.index] = isBit(triggerScratchPad[address.index], address.bit, isTrue);
  condition = isTrue && !wasTrue;
  handlePrint("TRIG", address, wasTrue, isTrue);  
}

void EQUALS(Address address)
{
  wasTrue = GETBIT(address);
  ISBIT(address, condition);
  isTrue = GETBIT(address);
  handlePrint("EQL", address, wasTrue, isTrue);
}

void EQUALS_NOT(Address address)
{
  wasTrue = GETBIT(address);
  ISBIT(address, !condition);
  isTrue = GETBIT(address);
  handlePrint("EQLNT", address, wasTrue, isTrue);
}

void SET0(Address address)
{
  wasTrue = GETBIT(address);  
  RESETBIT(address);
  isTrue = GETBIT(address);
  handlePrint("SET0", address, wasTrue, isTrue);    
}

void SET1(Address address)
{
  wasTrue = GETBIT(address);  
  RESETBIT(address);
  isTrue = GETBIT(address);
  handlePrint("SET1", address, wasTrue, isTrue);  
}

void FETCH_BIT(Address address)
{
  wasTrue = register.bit[register.index];
  if(1 > abs(lastFetch - programCounter))
  {
    clearRegisters();
  }
  isTrue = GETBIT(address);
  register.bit[register.index] = isTrue;
  register.index = (register.index + 1) % 16;
  
  handlePrint("FTCHB", address, wasTrue, isTrue);
  lastFetch = programCounter;    
}

void FETCH_DIGIT(Address address)
{
  int previous = shiftLeft(register.bit[register.index],3) + shiftLeft(register.bit[register.index],2) + shiftLeft(register.bit[register.index],1) + toInt(register.bit[register.index]);
  if(1 > abs(lastFetch - programCounter))
  {
    clearRegisters();
  }
  int current = GETWORD(address);
  WRITE_REGISTER(current);
  handlePrint("FTCHD", address, previous, current);
  lastFetch = programCounter;
}

int GETWORD(address) = scratchPad[address.index];

void FETCH_CONSTANT(Address address)
{  
  int previous = READ_REGISTER();
  int current = address.index;
  clearRegisters();
  WRITE_REGISTER(current);
  handlePrint("FTCHC", address, previous, current);  
}

int READ_REGISTER() = shiftLeft(register.bit[register.index+3],3) + shiftLeft(register.bit[register.index+2],2) + shiftLeft(register.bit[register.index+1],1) + register.bit[register.index];

void WRITE_REGISTER(int current)
{
  register.bit[register.index] = 0 < mask(current, 0);
  register.bit[register.index+1] = 0 < mask(current, 1);
  register.bit[register.index+2] = 0 < mask(current, 2);
  register.bit[register.index+3] = 0 < mask(current, 3);
  register.index = (register.index + 4) % 16;  
}  

void AND(Address address)
{
  isTrue = GETBIT(address);
  wasTrue = condition;
  condition = isTrue && wasTrue; 
  handlePrint("AND", address, wasTrue, isTrue);
}

void ANDNT(Address address)
{
  isTrue = GETBIT(address);
  wasTrue = condition;
  condition = wasTrue && !isTrue;
  handlePrint("ANDNT", address, wasTrue, isTrue);
}

void OR(Address address)
{
  isTrue = GETBIT(address);
  wasTrue = condition;
  condition = wasTrue || isTrue;
  handlePrint("OR", address, wasTrue, isTrue);
}

void ORNT(Address address)
{
  isTrue = GETBIT(address);
  wasTrue = condition;
  condition = wasTrue || !isTrue;
  handlePrint("ORNT", address, wasTrue, isTrue);
}

void JUMP_FORWARD_RELATIVE_FALSE(Address address)
{
  previous = programCounter;
  current = programCounter + address.index;  
  handlePrint("JFRF", address, previous, current);
  programCounter = current;
}

void JUMP_BACKWARD_RELATIVE_FALSE(Address address)
{
  previous = programCounter;
  current = programCounter - address.index;  
  handlePrint("JBRF", address, previous, current);
  programCounter = current;
}

bool GETBIT(Address address) = getBit(scratchPad[address.index], address.bit);

void ISBIT(Address address, bool newValue) = (true == newValue) ? SETBIT(address) : RESETBIT(address);

void SETBIT(Address address)
{
  scratchPad[address.index] = setBit(scratchPad[address.index], address.bit); 
}

void RESETBIT(Address address)
{
  scratchPad[address.index] = resetBit(scratchPad[address.index], address.bit);
}

Address generateAddress(str stringAddress)
{
  tokens = split(".", stringAddress);
  int index = parseInt(tokens[0]);
  int bit = size(tokens) > 1 ? parseInt(tokens[1]) : 0 ; 
  return <index, bit>; 
}

void goHandle()
{
  while(1 > 0)
  {
    handleInstruction();
  }
}

void handlePrint(str instruction, Address address, bool wasTrue, bool isTrue)
{
  debugPrint("<printHeader(instruction)> <right("<address.index>",6, " ")>.<address.bit> was <wasTrue>, is <isTrue> condition: <condition>");
}

void handlePrint(str instruction, Address address, int previous, int current)
{
  debugPrint("<printHeader(instruction)> <right("<address.index>",6, " ")> was <previous>, is <current>");
}

void handlePrint(str instruction)
{
  debugPrint(printHeader(instruction));
}

str printHeader(str instruction) = "<right("<programCounter>", 6, " ")> : <right(instruction, 6, " ")> :";


void handleInstruction()
{
  currentInstruction = "";
  try
  {
    currentInstruction = instructionList[programCounter];
  }
  catch:
  {
    debugPrint("End of program... restarting");
    programCounter = 0;
    return;
  }
  
  instructionNumber = parseInt(substring(currentInstruction, 0, 2));
  address = generateAddress(trim(substring(currentInstruction, 2)));
  debugPrint("<programCounter> : Handling instruction <instructionNumber> with data: <address>", showInstructions);  
  switch(instructionNumber)
  {
    case 0:
    {
      NOP();
    }
    case 1:
    {
      TRIGGER(address);
    }
    case 2:
    {
      EQUALS(address);
    }
    case 3:
    {
      EQUALS_NOT(address);
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
      if(true == condition)
      {
        SET0(address);
      }
    }
    case 9:
    {
      if(true == condition)
      {
        SET1(address);
      }
    }
    case 10:
    {
      ;
    }
    case 11:
    {
      if(true == condition)
      {
        FETCH_BIT(address);
      }
    }
    case 12:
    {
      if(true == condition)
      {
        FETCH_CONSTANT(address);
      }
    }
    case 13:
    {
      if(true == condition)
      {
        FETCH_DIGIT(address);
      }
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
      AND(address);
    }
    case 17:
    {
      ANDNT(address);
    }
    case 18:
    {
      OR(address);        
    }
    case 19:
    {
      ORNT(address);
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
      if(false == condition)
      {
        JUMP_BACK_RELATIVE_FALSE(address);
      }
    }
    case 30:
    {
      if(false == condition)
      {
        JUMP_FORWARD_RELATIVE_FALSE(address);
      }
    }
    case 31:
    {
      ;
    }  
  }
  programCounter+=1;
}