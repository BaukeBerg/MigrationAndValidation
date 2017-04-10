module testModule::ListUtilityTests

import utility::ListUtility;
import utility::TestUtility;


list[int] sampleCollection = [1,2,3,4,6];

test bool checkValid() = true == contains(sampleCollection, 3);
test bool checkLowBound() = false == contains(sampleCollection, 0);
test bool checkTopBound() = false == contains(sampleCollection, 7);
test bool checkCenterItem() = false == contains(sampleCollection, 5);

test bool checkListTrimming() = expectEqual(["Hello", "Goodbye"], trimList(["    \r\n   \t Hello", "Goodbye \n\r\t   "]));
test bool checkListTrimmingRemoveEmptyLines() = expectEqual(["Hello", "Goodbye"], trimList(["    \r\n   \t Hello", "              ", "Goodbye \n\r\t   "]));

test bool testListJoin() = expectEqual("Hello\r\nGoodbye", joinList(["Hello", "Goodbye"]));

test bool testTokenizedListTrimming() = expectEqual(["FilledLine$Hello", "FilledLineAsWell$GoodBye"], trimList(["FilledLine$Hello", "EmptyLine$", "FilledLineAsWell$GoodBye"], "$"));

list[str] moduleNames = ["Package.rsc", "Package2.rsc"];

test bool testPadding() = expectEqual(["import Package.rsc;", "import Package2.rsc;"], padList("import ", moduleNames, ";"));