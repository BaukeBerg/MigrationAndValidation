module testModule::SymbolTableTests

import FileLocations;
import Parser;
import PC20Syntax;
import SymbolTable;

import utility::TestUtility;

test bool testParsingTotalSymbolTable() = expectEqual(0, parsePdsSymbols("DR_TOT_3.SYM"));

test bool testSymbolLoading() = expectEqual("!triggerpuls laden timer fase 64", retrieveComment("403.0", loadSymbols("CommentedSymbols.SYM")), "Looking up addresses should return the comment");
test bool parseSingleSymbol() = isUnAmbiguous("REG0T62 = 402.2 !triggerpuls laden timer fase 62", #start[PlcSymbols]);