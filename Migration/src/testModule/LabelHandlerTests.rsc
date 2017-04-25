module testModule::LabelHandlerTests

import Compiler;
import LabelHandler;

import utility::TestUtility;

LabelDeclaration expectedDeclaration = <"L12456", "1234">;

test bool testComposing() = expectEqual(expectedDeclaration, composeLabel("L12456", 1234));

LabelList labels = [ <"L00004", "4">,<"L00006", "6">, <"L00008", "8">];

test bool testLabels() = expectEqual(labels, compile("LabelSamples").labels);

test bool testLabelFile() = expectEqual(extractLabelList("DR_TOT_3.lbl"), compile("SmallPart").labels);\
