module testModule::MathUtilityTests

import String;

import utility::MathUtility;
import utility::TestUtility;

test bool testLimitsBelow() = expectEqual(0, limit(0, -10, 10), "Test value is below lower limit");
test bool testLimitsAbove() = expectEqual(10, limit(0, 110, 10), "Test value is above upper limit");
test bool testLimitsBetween() = expectEqual(5, limit(0, 5, 10), "Value is in between");

test bool testInLimitsCenter() = expectTrue(inLimits(0, 5, 10), "5 lies between 0 and 10");
test bool testInLimitsLowerBound() = expectTrue(inLimits(0, 0, 10), "0 lies at lower bound 0");
test bool testInLimitsUpperBound() = expectTrue(inLimits(0, 10, 10), "10 lies at upper bound 10");

test bool testInLimitsBelowLowerBound() = expectFalse(inLimits(0, -5, 10), "-5 lies below lower bound 0");
test bool testInLimitsAboveUpperBound() = expectFalse(inLimits(0, 15, 10), "15 lies above upper bound 10");

test bool testShiftingLeft() = expectEqual(2, shiftLeft(1,1), "1 shl 1: 2");
test bool testShiftingRight() = expectEqual(2, shiftRight(4,1), "4 shr 1: 2");

test bool testShiftingRightNothing() = expectEqual(8, shiftLeft(8,0), "no positions remains the same");
test bool testShiftingLeftNothing() = expectEqual(8, shiftRight(8,0), "no positions remains the same");

test bool testInverseShiftingLeft() = expectEqual(1, shiftLeft(2, -1), "negative shifting");
test bool testInverseShiftingRight() = expectEqual(4, shiftRight(2, -1), "negative shifting");

test bool testOtherValuesRight() = expectEqual(1, shiftRight(3,1));
test bool testZeroResultRight() = expectEqual(0, shiftRight(15,4));

test bool testOtherValuesLeft() = expectEqual(1, shiftLeft(3,-1));
test bool testZeroResultLeft() = expectEqual(0, shiftLeft(15,-4));

test bool testMaskingNibble() = expectEqual(toInt("0xF"), mask(toInt("0xFF"), toInt("0xF")));

test bool testMaskingBit() = expectEqual(1, mask(toInt("0xFF"), 1));
test bool testMaskingSecondBit() = expectEqual(2, mask(toInt("0xFF"), 2));
test bool testMaskingTwoBit() = expectEqual(3, mask(toInt("0xFF"), 3));
test bool testMaskingUpperBit() = expectEqual(16, mask(255, 16));

test bool testMaskingValues() = expectEqual(32, mask(32,32));
test bool testLargeMask() = expectEqual(0, mask(32,64));

