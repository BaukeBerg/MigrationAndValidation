module testModule::CompilerTests

import Compiler;
import FileLocations;
import IO;
import List;
import Parser;
import PC20Syntax;
import String;
import SymbolTable;

import utility::Debugging;
import utility::StringUtility;
import utility::TestUtility;

test bool testEmptyInstruction() = expectEqual("00000                   ", formatLine(0));
test bool testIntAddressFormat() = expectEqual("12345 54321 99 67890    ", formatLine(12345, 54321, 99, "67890")); 
test bool testRealAddressFormat() = expectEqual("00010 00000 15 00023.1  ", formatLine(10, 0, 15, "23.1"));
test bool testFormatSize() = expectEqual(24, size(formatLine(0,0,0,"0")));

test bool testSingleNop() = expectEqual([padLength("00000 00000 00", 15)], handleNop(1, 0, 0));

list[str] multipleNop = [padLength("00010 00005 00",15), padLength("00010 00006 00", 15), padLength("00010 00007 00",15)];

test bool testMultipleNop() = expectEqual(multipleNop, handleNop(3, 10, 5));
test bool testMultipleNopParsed() = expectEqual(multipleNop, handleNop(parseText("NOP 3", #Expression), 10, 5));

symbolTable loadSymbols()
{
  cachedFile = generatedFile("DR_TOT_3.symbolTable");
  if(exists(cachedFile))
  {
    debugPrint("Loading cached symbols from file");
    return readSymbolTableFromFile(cachedFile);
  }  
  symbols = generateSymbolTable("DR_TOT_3.SYM");
  writeSymbolTableToFile(cachedFile, symbols);
  debugPrint("Generated new symbol cache");
  return symbols;
}

symbolTable symbols = loadSymbols();

test bool testSimplePair()
{
  compile("Sample.PRG", symbols);
  return true;
}

test bool testSimpleLabel()
{
  lines = compile("SimpleLabel.PRG", symbols).compiledLines;
  referenceData = take(size(lines), readFileLines(generatedFile("strippedLines")));
  return expectEqual(referenceData, lines);
}

test bool testComparing() = handleCompare(compile("LabelOffset.PRG", symbols).compiledLines);
test bool testFirstOneHundred() = handleCompare(compile("FirstOneHundred.PRG", symbols).compiledLines);
test bool testNopBlankLine() = expectEqual(compile("BlankLineIssue.PRG", symbols).compiledLines, readFileLines(testFile("BlankLineComparison.PRN")));   

bool handleCompare(list[str] compiledLines)
{
  referenceData = take(size(compiledLines), readFileLines(generatedFile("strippedLines")));
  return expectEqual(referenceData, compiledLines);
}

