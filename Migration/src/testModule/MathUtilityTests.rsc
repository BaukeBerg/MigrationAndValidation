module testModule::MathUtilityTests

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
