module testModule::EcbHandlerTests

import EcbHandler;

import utility::TestUtility;

str expectedLargeRange = "12345-67890";
str expectedSmallRange = "00000-00010";

test bool testLargeRange() = expectEqual(expectedLargeRange, "<composeSourceRange(12345, 67890)>", "Large range should yield 5 digit response");
test bool testSmallRange() = expectEqual(expectedSmallRange, "<composeSourceRange(0, 10)>", "Smaller range should automatically pad to 5 digits");

