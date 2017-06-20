module testModule::ParserTests

import utility::TestUtility;

import FileLocations;
import IO;
import Parser;
import ParseTree;
import PC20Syntax;

test bool testParsingSymbols() = expectEqual(0, parsePdsSymbols("simpleDeclarations"));
test bool testParsingSources() = expectEqual(0, parsePdsSource("simpleLabel"));
test bool testParsingRoutine() = expectEqual(0, parsePdsSource("simpleRoutine"));
test bool testParsingPartialSource() = expectEqual(0, parsePdsSource("SmallPart.PRG"));
test bool testParsingTotalSource() = expectEqual(0, parsePdsSource("DR_TOT_3.PRG"));

test bool testParsingLabels() = isCorrect("L02840:2840L12769:12769L03429:3429L12902:12902\r\nL10103:10103L04037:4037", #start[LabelList]);

test bool testParsingNop() = isCorrect("NOP 57", #Expression);

test bool testLocation()
{
  LineNumber = -1;
  visit(generateSourceTree("SingleLine.PRG"))
  {
    case Instruction I:
    {
      println("Inst<I>");
    }
    case PdsComment C:
    {
      println("Comment location is <C@\loc>");
      LineNumber = C@\loc.begin.line;
    }
  }
  return expectEqual(1, LineNumber, "Line number of comment should be 1");
}

test bool testLogicInstruction1() = isCorrect("00008 00000 31 00003    \r\n", #LogicInstruction);
test bool testLogicInstruction21() = isCorrect("00008 00000 21 00003    \r\n", #LogicInstruction);
test bool testLogicInstruction22() = isCorrect("00008 00000 22 00003    \r\n", #LogicInstruction);
test bool testLogicInstruction23() = isCorrect("00008 00000 23 00003    \r\n", #LogicInstruction);
test bool testLogicInstruction26() = isCorrect("00008 00000 26 00003    \r\n", #LogicInstruction);
test bool testLogicInstruction27() = isCorrect("00008 00000 27 00003    \r\n", #LogicInstruction);

// Jumps should not be parseable by #LogicInstrcuction to remove ambiguity
test bool testLogicJump1() = expectFalse(isCorrect("00008 00000 24 00003    \r\n", #LogicInstruction));
test bool testLogicJump2() = expectFalse(isCorrect("00008 00000 25 00003    \r\n", #LogicInstruction));
test bool testLogicJump3() = expectFalse(isCorrect("00008 00000 28 00003    \r\n", #LogicInstruction));
test bool testLogicJump4() = expectFalse(isCorrect("00008 00000 29 00003    \r\n", #LogicInstruction));
