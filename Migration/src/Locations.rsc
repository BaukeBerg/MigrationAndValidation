module Locations

import String;

// Test file calls
public loc testFile(str fileName) = toLocation(testFilePath + fileName);
public loc outputFile(str fileName) = toLocation(outputFilePath + fileName);

public str projectPath = "project://Migration/";
public str outputFilePath = projectPath+"outputFiles/";
public str testFilePath = projectPath +"testFiles/";