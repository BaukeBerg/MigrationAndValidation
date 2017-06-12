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

test bool testParsingCompiledComment() = isCorrect("00001                   !                       DR_INIT3\r\n", #CompiledComment);
test bool testParsingCompiledCommentFile() = isCorrect(compiledFile("comments.compile"), #start[PC20_Compiled]);
test bool testParsingFirstLine() = isCorrect("00001                   !                       DR_INIT3\r\n", #start[PC20_Compiled]);
test bool testManualFileReading() = isCorrect(readFile(compiledFile("comments.compile")), #start[PC20_Compiled]);

test bool testDisassembling() = isCorrect("sample.obj", #start[PC20_Assembled]);

