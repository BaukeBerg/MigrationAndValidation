module testModule::CompilerTests

import Compiler;
import String;

import utility::TestUtility;

test bool testEmptyInstruction() = expectEqual("00000                   ", formatLine(0));
test bool testIntAddressFormat() = expectEqual("12345 54321 99 67890    ", formatLine(12345, 54321, 99, 67890)); 
test bool testRealAddressFormat() = expectEqual("00010 00000 15 00023.1  ", formatLine(10, 0, 15, 23.1));
test bool testFormatSize() = expectEqual(24, size(formatLine(0,0,0,0)));


