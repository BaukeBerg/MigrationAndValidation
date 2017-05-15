module testModule::LabelHandlerTests

import Compiler;
import FileLocations;
import LabelHandler;
import List;
import Parser;

import utility::TestUtility;

LabelDeclaration expectedDeclaration = <"L12456", "1234">;

test bool testComposing() = expectEqual(expectedDeclaration, composeLabel("L12456", 1234));

LabelList labels = [ <"L00004", "4">,<"L00006", "6">, <"L00008", "8">];

test bool testLabels() = expectEqual(labels, compile("LabelSamples.PRG").labels);

test bool testLabelFile() = compareLabels(compile("SmallPart.PRG").labels);

bool compareTotalFile() = compareLabels(compile("DR_TOT_3.PRG").labels);

bool compareLabels(LabelList labels)
{ 
  comparedList = take(size(labels), extractLabelList(generatedFile("DR_TOT_3.lbl")));
  return expectEqual(comparedList, labels);
}

str expectedString = "L00004:4\r\nL00006:6\r\nL00008:8";


test bool testExtractString() = expectEqual(expectedString, extractLabelString(testFile("simpleLabel.lbl")));
test bool testParsing() = isUnAmbiguous(expectedString, #start[LabelList]);
test bool testReading() = expectEqual(labels, smallLabels(), "Reading this file should yield this list");

LabelList smallLabels() = extractLabelList(testFile("simpleLabel.lbl"));