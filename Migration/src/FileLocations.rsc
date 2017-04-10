module FileLocations

import String;

public str projectRoot = "project://Migration/";
public str outputDir = "<projectRoot>output/";
public str sampleDir = "<projectRoot>sampleFiles/";
public str sourceDir = "<projectRoot>src/";

// location definitions
public str projectPath = "project://Migration/";
public str outputFilePath = "<projectPath>outputFiles/";
public str testFilePath = "<projectPath>testFiles/";
public str generatedFilePath = "<sourceDir>generated/";

// directory calls
public loc testDir = toLocation("<projectRoot>src/testModule/");

// test file calls
public loc outputFile(str forFile) = toLocation("<outputFilePath><forFile>");
public loc sampleFile(str forFile) = toLocation("<sampleDir><forFile>");
public loc testFile(str forFile) = toLocation("<testFilePath><forFile>");
public loc generatedFile(str forFile) = toLocation("<generatedFilePath><forFile>");
