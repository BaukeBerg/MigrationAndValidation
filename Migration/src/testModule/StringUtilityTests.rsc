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

test bool testSpecificPadding() = expectEqual("10aaa", padString("10", "a", 6));
test bool testDefaultPadding() = expectEqual("10    ", padString("10", 6));
