module testModule::ParserTests

import utility::TestUtility;
import Parser;

test bool testParsingSymbols() = expectEqual(0, parsePdsSymbols("simpleDeclarations"));

test bool testParsingSources() = expectEqual(0, parsePdsSource("simpleLabel"));

test bool testParsingRoutine() = expectEqual(0, parsePdsSource("simpleRoutine"));

test bool testParsingTotalSource() = expectEqual(0, parsePdsSource("DR_TOT_3.PRG"));
test bool testParsingTotalSymbolTable() = expectEqual(0, parsePdsSymbols("DR_TOT_3.SYM"));