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
import PC20Syntax;

import vis::Figure;
import vis::ParseTree;
import vis::Render;

void showCommentTree() = renderParsetree(parseComments());
void showCommentFigure() = highLightSources(parseComments());
void showTotalFigure() = showFigure("DR_TOT_3.compiled");
void showFirst50Figure() = showFigure("first50.compiled");
void showFirst100Figure() = showFigure("first100.compiled");
void showFirst200Figure() = showFigure("first200.compiled");
void showFirst500Figure() = showFigure("first500.compiled");
void show1kSample() = showFigure("first1000.compiled");
void showSamples() = showFigure("sampleIssues.compiled");

test bool testSamples() = testFigures(true, "sampleIssues.compiled");
test bool testEventBug() = testFigures(false, "eventBug.compiled" );

bool testFigures(bool shouldBeEmpty, str fileName)
{
  displayExtractedBlocks = false;
  result = shouldBeEmpty == isEmpty(generateFigures(fileName));
  displayExtractedBlocks = true;
  if(false == result)
  {
    showFigures(generateFigures(fileName));    
  }
  
  return result;
}

test bool testComments() = isUnAmbiguous(parseComments());
test bool testSample() = isUnAmbiguous(parseCompiledFile("first50.compiled"));
test bool testTotal() = isUnAmbiguous(parseTotalFile());

test bool testFirst500() = isUnAmbiguous(parseCompiledFile("first500.compiled"));

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


