module testModule::InstructionUtilityTests

import utility::InstructionUtility;
import utility::TestUtility;

str ExpectedRange = "02120,02121,02122,02123";

list[str] SampleInput = [ "12569 10778 13 02120 \r\n",   
                          "12570 10779 13 02121 \r\n",    
                          "12571 10780 13 02122 \r\n",    
                          "12572 10781 13 02123 \r\n"];
                            


test bool testSingleAddress() = expectEqual("00100", addressRange(["00045 00019 01 00100  \r\n"]));
test bool testAddressRange() = expectEqual(ExpectedRange, addressRange(SampleInput));

