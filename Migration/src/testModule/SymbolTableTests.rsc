module testModule::SymbolTableTests

import FileLocations;
import Parser;
import PC20Syntax;
import SymbolTable;

import utility::TestUtility;

import testModule::DataModule;

test bool testParsingTotalSymbolTable() = expectEqual(0, parsePdsSymbols("DR_TOT_3.SYM"));

test bool testRetrievingByAddressExecption() = expectEqual("UNKNOWN-IDENTIFIER", retrieveComment("403.0", symbols), "Looking up addresses should return the comment");
test bool testRetrievingByLabel() = expectEqual("!triggerpuls laden timer fase 64", retrieveComment("REG0T64", symbols), "Looking up addresses should return the comment");

test bool parseSingleSymbol() = isUnAmbiguous("REG0T62 = 402.2 !triggerpuls laden timer fase 62", #start[PlcSymbols]);

test bool retrieveCommentByLabel() = expectEqual("!regeneratiefase 9", retrieveComment("REG0B09", symbols), "Retrieving by label should return correct comment");

test bool testContainsPartial() = expectTrue(contains("00320", symbols));
test bool testContainsBit() = expectTrue(contains("00320.1", symbols));

test bool testBooleans() = expectTrue(isBoolean("00320", symbols), "Address 320 is divided by booleans");

test bool testUnusedAddress() = expectFalse(isBoolean("00079", symbols), "An unused address should return false");
test bool testWordAddress() = expectFalse(isBoolean("01218", symbols), "A word-based address should return false");
