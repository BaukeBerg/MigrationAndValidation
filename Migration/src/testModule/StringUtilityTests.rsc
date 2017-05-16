module testModule::StringUtilityTests

import Map;
import String;

import utility::StringUtility;
import utility::TestUtility;

test bool testTrimAssumption() = expectEqual("Hallo", trim("\n\r\t   Hallo\n\r\t"));

test bool testStringToken() = expectEqual("Substring", stringToken("{Substring}", "{", "}"));
test bool testStringTokenOverLoad() = expectEqual("Substring", stringToken("{Substring}", "{", 10));
test bool testStringTokenOverLoad() = expectEqual("Substring", stringToken("bool Substring()", 5, "()"));
test bool testLargerStringToken() = expectEqual("Substring", stringToken("---\>Substring\<---", "---\>", "\<---"));
test bool testSubStringEquivalence() = expectEqual(substring("FailPass", 0,4), stringToken("FailPass", 0,4));
test bool testSubStringInt() = expectEqual("Pass", stringToken("FailPass", 4, ""));

str inlineCommentString = "Hello/*InlineComment*/GoodBye";

test bool testClipString() = expectEqual("HelloGoodBye", clipString(inlineCommentString, "/*", "*/"));
test bool testClipStringWithSplit() = expectEqual("Hello\r\nGoodBye", clipString(inlineCommentString, "/*", "*/", "\r\n")); 

test bool testParseInt() = expectEqual(-1, parseInt("hallo"));
test bool testParseInt() = expectEqual(30, parseInt("30"));


// Add some tests to make sure parseInt does not mistake input for binary, octal or hexadecimal
test bool testParseIntBinary() = expectEqual(10, parseInt("00010"), "Check that 10 is reported instead of 3");
test bool testParseIntOctal() = expectEqual(70, parseInt("00070"), "Check that 70 is reported instead of 56");
test bool testParseIntHexadecimal() = expectEqual(-1, parseInt("0001F"), "Check that hex input is considered erroneous");
