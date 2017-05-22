module testModule::ParserTests

import utility::TestUtility;
import IO;
import Parser;
import ParseTree;
import PC20Syntax;

test bool testParsingSymbols() = expectEqual(0, parsePdsSymbols("simpleDeclarations"));
test bool testParsingSources() = expectEqual(0, parsePdsSource("simpleLabel"));
test bool testParsingRoutine() = expectEqual(0, parsePdsSource("simpleRoutine"));
test bool testParsingPartialSource() = expectEqual(0, parsePdsSource("SmallPart.PRG"));
test bool testParsingTotalSource() = expectEqual(0, parsePdsSource("DR_TOT_3.PRG"));

test bool testParsingLabels() = isUnAmbiguous("L02840:2840L12769:12769L03429:3429L12902:12902\r\nL10103:10103L04037:4037", #start[LabelList]);

test bool testParsingNop() = isUnAmbiguous("NOP 57", #Expression);

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