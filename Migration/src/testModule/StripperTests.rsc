module testModule::StripperTests

import Stripper;

import utility::TestUtility;

test bool testLineNumberMultipleNop() = expectEqual(15, findEndPos("02488 02156 00 "), "Multiple Nop is shorter after first line"); 

test bool testLineNumberSingleNop() = expectEqual(24, findEndPos("00138 00152 00            NOP 1"), "Exposed bug with first NOP");
test bool testErroneousComment() = expectEqual(24, findEndPos("00132 00147 14 02000      STRD  STP00_0 !setpoint 00 eenheden"), "Exposed bug with line number");
