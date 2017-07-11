module testModule::ModelExtractorTests

import FileLocations;
import ModelExtractor;
import Parser;
import Stripper;

import utility::Debugging;
import utility::FileUtility;
import utility::ListUtility;
import utility::TestUtility;

import IO;
import ParseTree;

import vis::Figure;
import vis::ParseTree;
import vis::Render;

void showCommentTree() = renderParsetree(parseComments());
void showCommentFigure() = highLightSources(parseComments());
void showTotalFigure() = showFigure("DR_TOT_3.compiled");
void showSampleFigure() = showFigure("first50.compiled");
void showFirst100Figure() = showFigure("first100.compiled");
void showFirst200Figure() = showFigure("first200.compiled");
void showFirst500Figure() = showFigure("first500.compiled");
void show1kSample() = showFigure("first1000.compiled");

test bool testSamples() = expectEqual(0, size(generateFigures("sampleIssues.compiled")));

test bool testComments() = isUnAmbiguous(parseComments());
test bool testSample() = isUnAmbiguous(parseCompiledFile("first50.compiled"));
test bool testTotal() = isUnAmbiguous(parseTotalFile());

Tree parseComments() = parseCompiledFile("comments.compiled");
Tree parseTotalFile() = parseCompiledFile("DR_TOT_3.compiled");

void showTree(str fileName) = renderParsetree(parseCompiledFile(fileName));
void showFigure(str fileName) = highLightSources(parseCompiledFile(fileName), readFileLines(compiledFile(fileName)));


void generateInstructions(str fileName)
{
  instructions = instructionList(readFileLines(compiledFile(fileName)));
  instructions = padList("", instructions, "\r\n");
  writeFile(generatedFile("<stripFileExtension(fileName)>.instructions"), instructions);
}
