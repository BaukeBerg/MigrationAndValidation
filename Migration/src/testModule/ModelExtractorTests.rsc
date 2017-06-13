module testModule::ModelExtractorTests

import FileLocations;
import ModelExtractor;
import Parser;
import Stripper;

import utility::ListUtility;

import IO;
import ParseTree;

import vis::Figure;
import vis::ParseTree;
import vis::Render;

void showCommentTree() = renderParsetree(parseComments());
void showCommentFigure() = highLightSources(parseComments());

test bool testComments() = isUnAmbiguous(parseComments());
test bool testSample() = isUnAmbiguous(parseCompiledFile("first50.compiled"));
test bool testTotal() = isUnAmbiguous(parseCompiledFile("DR_TOT_3.compiled"));

Tree parseComments() = parseCompiledFile("comments.compiled");

void showTree(str fileName) = renderParsetree(parseCompiledFile(fileName));
void showFigure(str fileName) = highLightSources(parseCompiledFile(fileName), readFileLines(compiledFile(fileName)));

Tree parseCompiledFile(str fileName) = parseText(joinList(clipAndSave(compiledFile(fileName)))+"\r\n", #start[PC20_Compiled]);

