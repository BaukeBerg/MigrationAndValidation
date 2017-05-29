module testModule::SymbolTableTests

import FileLocations;
import Parser;
import PC20Syntax;
import SymbolTable;

import utility::TestUtility;

import testModule::DataModule;

test bool testParsingTotalSymbolTable() = expectEqual(0, parsePdsSymbols("DR_TOT_3.SYM"));

test bool testRetrievingByAddress() = expectEqual("!triggerpuls laden timer fase 64", retrieveComment("403.0", symbols), "Looking up addresses should return the comment");
test bool parseSingleSymbol() = isUnAmbiguous("REG0T62 = 402.2 !triggerpuls laden timer fase 62", #start[PlcSymbols]);

test bool testRetrieveCommentsLeadingZeroes() = expectEqual("!regeneratie fase 61", retrieveComment("00400.1", symbols), "Leading zeroes should be no problem");