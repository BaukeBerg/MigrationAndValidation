module testModule::PreProcessorTests

import EcbHandler;
import ParseTree;
import PC20Syntax;
import PreProcessor;

import utility::InstructionUtility;
import utility::TestUtility;

str expectedPrefix = "++Lime++CodeBlock: 00024-00038 is " ;
str expectedBlock = "<expectedPrefix>AssignConstant 00000 to 00320,00321,00322,00323,00324,00325,00326,00327,00328,00329,00330,00331,00332,00333";

public FetchConstantInstruction sampleFetch = parse(#FetchConstantInstruction, "00051 00024 12 00000 \r\n");
public WriteValue sampleWrite = parse(#WriteValue, "++++CodeBlock: 00025-00038 is WriteValue 00320,00321,00322,00323,00324,00325,00326,00327,00328,00329,00330,00331,00332,00333");

test bool testComposingAssignConstant() = expectEqual(expectedBlock, composeAssignConstant(sampleFetch, sampleWrite), "Fetch constant + WriteValue composes to assignConstant");

test bool testComposingPrefix() = expectEqual(expectedPrefix, composeEcbPrefix("Lime", composeSourceRange(sampleFetch, sampleWrite)));

test bool testComposingRange() = expectEqual(<24, 38>, composeSourceRange(sampleFetch, sampleWrite));
test bool testComposingValue() = expectEqual("00000", getAddress(sampleFetch));