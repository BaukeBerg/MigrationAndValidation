module testModule::TestUtilityTests


import IO;

import \utility::TestUtility;

import vis::Figure;

// tests the testUtility, since it's our own library, it must be tested
test bool expectEqualIntTest() = expectEqual(5,5);
test bool expectFalseIsEqualIntTest() = (false == expectEqual(4,5));

test bool expectNotEqualintTest() = expectNotEqual(4,5);
test bool expectFalseIsNotEqualintTest() = (false == expectNotEqual(5,5));

test bool expectTrueTestTrue() = (true == expectTrue(true));
test bool expectTrueTestFalse()= (false == expectTrue(false));

test bool expectFalseTestTrue() = (true == expectFalse(false));
test bool expectFalseTestTrue() = (false == expectFalse(true));

//test bool testEqualFiles() = expectEqualFiles(someSampleFile, readFileLines(someSampleFile));

//test bool testEqualFiles() = expectEqualFiles(someSampleFile, someSampleFile);
//test bool testUnEqualFiles() = (false == expectEqualFiles(someSampleFile, someOtherSampleFile));
