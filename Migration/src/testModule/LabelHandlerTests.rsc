module testModule::LabelHandlerTests

import LabelHandler;

import utility::TestUtility;

LabelDeclaration expectedDeclaration = <"L12456", "1234">;

test bool testComposing() = expectEqual(expectedDeclaration, composeLabel("L12456", 1234));
