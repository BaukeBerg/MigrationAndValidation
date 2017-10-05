module testModule::SymbolTableTests

import FileLocations;
import Parser;
import PC20Syntax;
import Environment;

import utility::TestUtility;

import testModule::DataModule;

test bool testParsingTotalSymbolTable() = expectEqual(0, parsePdsSymbols("DR_TOT_3.SYM"));

test bool testRetrievingByAddressExecption() = expectEqual("!triggerpuls laden timer fase 64", retrieveComment("403.0", symbols), "Looking up addresses should return the comment");
test bool testRetrievingByLabel() = expectEqual("!triggerpuls laden timer fase 64", retrieveComment("REG0T64", symbols), "Looking up addresses should return the comment");

test bool parseSingleSymbol() = isUnAmbiguous("REG0T62 = 402.2 !triggerpuls laden timer fase 62", #start[PlcSymbols]);

test bool retrieveCommentByLabel() = expectEqual("!regeneratiefase 9", retrieveComment("REG0B09", symbols), "Retrieving by label should return correct comment");

test bool testContainsPartial() = expectTrue(contains("00320", symbols));
test bool testContainsBit() = expectTrue(contains("00320.1", symbols));

test bool testBooleans() = expectTrue(isBoolean("00320", symbols), "Address 320 is divided by booleans");
test bool testUnusedBitAddress() = expectFalse(isBoolean("00079", symbols), "An unused address should return false");
test bool testWordAddress() = expectFalse(isBoolean("01218", symbols), "A word-based address should return false");

test bool testUnusedWordAddress() = expectFalse(isWord("00079", symbols), "An unused word address should return false");
test bool testUsedWordAddress() = expectTrue(isWord("01218", symbols), "A word-based address should return true");
test bool testUsedBitAddress() = expectFalse(isWord("00320", symbols), "A bit address should return false");

list[str] expectedAddressList = ["320.0", "320.1", "320.2", "320.3"] ;

test bool testRetrievingAddresses() = expectEqual(expectedAddressList, retrieveAddressList("00320", symbols), "Looking up an address should return bit addresses");

test bool retrieveCommentByShortAddress() = expectEqual("!10 sec. puls", retrieveComment("1.2", symbols), "Comments can be retrieved by querying with the address");
test bool retrieveCommentByLongAddress() = expectEqual("!10 sec. puls", retrieveComment("00001.2", symbols), "Comments can be retrieved by querying with the address");
test bool retrieveCommentAddressWithSpaces() = expectEqual("!10 sec. puls", retrieveComment("   00001.2 ", symbols), "Comments can be retrieved by querying with the address");