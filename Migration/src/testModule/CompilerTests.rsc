module testModule::CompilerTests

import Compiler;
import List;
import String;

import utility::StringUtility;
import utility::TestUtility;

test bool testEmptyInstruction() = expectEqual("00000                   ", formatLine(0));
test bool testIntAddressFormat() = expectEqual("12345 54321 99 67890    ", formatLine(12345, 54321, 99, "67890")); 
test bool testRealAddressFormat() = expectEqual("00010 00000 15 00023.1  ", formatLine(10, 0, 15, "23.1"));
test bool testFormatSize() = expectEqual(24, size(formatLine(0,0,0,"0")));

test bool testSingleNop() = expectEqual([padLength("00000 00000 00", 15)], handleNop(1, 0, 0));

list[str] multipleNop = [padLength("00010 00005 00",15), padLength("00011 00006 00", 15), padLength("00012 00007 00",15)];

test bool testMultipleNop() = expectEqual(multipleNop, handleNop(3, 10, 5));

test bool testSimplePair()
{
  compile("Sample.PRG", "Sample.SYM");
  return true;
}

test bool testLabels()
{
  LabelList list = compile("DR_TOT_3.PRG").labelList;
  