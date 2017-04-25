module testModule::LabelHandlerTests

import Compiler;
import FileLocations;
import LabelHandler;
import List;

import utility::TestUtility;

LabelDeclaration expectedDeclaration = <"L12456", "1234">;

test bool testComposing() = expectEqual(expectedDeclaration, composeLabel("L12456", 1234));

LabelList labels = [ <"L00004", "4">,<"L00006", "6">, <"L00008", "8">];

test bool testLabels() = expectEqual(labels, compile("LabelSamples").labels);

test bool testLabelFile()
{
  generatedList = compile("SmallPart").labels;
  comparedList = take(size(generatedList), extractLabelList(generatedFile("DR_TOT_3.lbl")));
  return expectEqual(comparedList, generatedList, "Sample label list should be equal to first part of the total list");
}
   
