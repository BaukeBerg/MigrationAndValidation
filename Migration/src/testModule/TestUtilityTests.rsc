module testModule::TestUtilityTests


import IO;

import \utility::TestUtility;

import vis::Figure;

// tests the testUtility, since it's our own library, it must be tested
test bool expectEqualIntTest() = expectEqual(5,5);
test bool expectFalseIsEqualIntTest() = !expectEqual(4,5);

test bool expectNotEqualintTest() = expectNotEqual(4,5);
test bool expectFalseIsNotEqualintTest() = !expectNotEqual(5,5);

test bool expectTrueTestTrue() = expectTrue(true);
test bool expectTrueTestFalse()= !expectTrue(false);

test bool expectFalseTestTrue() = expectFalse(false);
test bool expectFalseTestTrue() = !expectFalse(true);

test bool expectDetectionOfDifferentSizeFirst() = expectFalse([], [""]);
test bool expectDetectionOfDifferentSizeSecond() = expectFalse([""], []);
test bool expectDetectionOfDifferentContent() = expectFalse(["A"], ["B"]);
test bool expectDetectionOfEqualContent() = expectTrue(["A"], ["A"]);