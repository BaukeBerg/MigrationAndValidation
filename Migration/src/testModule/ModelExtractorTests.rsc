module testModule::ModelExtractorTests

import FileLocations;
import ModelExtractor;
import Parser;
import Stripper;

import utility::ListUtility;

import ParseTree;

import vis::Figure;
import vis::ParseTree;
import vis::Render;

void showCommentTree() = renderParsetree(parseComments());
void showCommentFigure() = highLightSources(parseComments());

Tree parseComments() = parseText(joinList(clipAndSave(compiledFile("comments.compile")))+"\r\n", #start[PC20_Compiled]);

