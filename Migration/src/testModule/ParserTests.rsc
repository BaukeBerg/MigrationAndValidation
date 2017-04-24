module testModule::ParserTests

import utility::TestUtility;
import Parser;

test bool testParsingSymbols() = expectEqual(0, parsePdsSymbols("simpleDeclarations"));

test bool testParsingSources() = expectEqual(0, parsePdsSource("simpleLabel"));

test bool testParsingRoutine() = expectEqual(0, parsePdsSource("simpleRoutine"));

test bool testParsingTotalSource() = expectEqual(0, parsePdsSource("DR_TOT_3.PRG"));
test bool testParsingTotalSymbolTable() = expectEqual(0, parsePdsSymbols("DR_TOT_3.SYM"));

test bool testParsingLabels() = isUnAmbiguous("L02840:2840L12769:12769L03429:3429L12902:12902\r\nL10103:10103L04037:4037", #start[LabelList]);
