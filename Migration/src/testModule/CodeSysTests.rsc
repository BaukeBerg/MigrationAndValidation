module testModule::CodeSysTests

import CodeSysGenerator;
import CodesysSyntax;
import CodesysTypes;
import FileLocations;
import IO;
import ParseTree;
import Parser;
import ParserBase;
import PreProcessor;
import PC20Syntax;
import Environment;
import String;

import utility::FileUtility;
import utility::TestUtility;

list[str] emptyProgram = ["PROGRAM PLC_PRG", "VAR", "END_VAR", "END_PROGRAM"];

PlcProgram emptyModel = <[], []>;

test bool testGeneratingEmptyProgram() = expectEqual(emptyProgram, generateOutput(emptyModel));

str sampleBool = "  theBool : BOOL ; (* 0.1 !IAmBool *)";
Symbol boolean = <"theBool", "0.1", "!IAmBool", "">;

str sampleInt = "  numeric : INT ; (* 100 !Numeric *)";
Symbol integer = <"numeric", "100", "!Numeric", "">;

test bool testBooleanVariable() = expectEqual(sampleBool, extractVariable(boolean), "boolean types are distinguished based on the .");
test bool testIntegerVariable() = expectEqual(sampleInt, extractVariable(integer), "int values are converted based on the missing int");

Symbol faultyName = <"S_0,1SEC","511.0","!triggerpuls 0,1 sec.", "">;
str expectedResult = "  S_0_1SEC : BOOL ; (* 511.0 !triggerpuls 0,1 sec. *)";

test bool testInvalidChars() = expectEqual(expectedResult, extractVariable(faultyName), "Invalid chars are replaced by underscores");

str constantString = "++Lime++CodeBlock: 00024-00038 is AssignConstant 00000 to 00320,00321,00322,00323,00324,00325,00326,00327,00328,00329,00330,00331,00332,00333";
public AssignConstant constant = parse(#AssignConstant, constantString);

public SymbolTable symbols = loadSymbols("DR_TOT_3");

list[str] expectedResetBitStatements = ["ALARM01 := false ; (* !spoeldruk te hoog *)",
                                    "ALARM02 := false ; (* !stuurlucht gestoord *)",
                                    "ALARM03 := false ; (* !stuurspanning gestoord *)",
                                    "ALARM04 := false ; (* !vuilwatertank bijna leeg *)"];
                                    
list[str] expectedResetValidStatements = ["ALARM05 := true ; (* !vuilwatertank leeg *)",
                                    "ALARM06 := false ; (* !geleidbaarheid na spoelen *)",
                                    "ALARM07 := true ; (* !filtercapaciteit te laag *)",
                                    "ALARM08 := false ; (* !concentraat afvoer gestoord *)"];
                                         
test bool testBitConversionWithZero() = expectEqual(expectedResetBitStatements, evaluateAssign(symbols, "00320", 0), "resetting bits word-wise must expand to bitwyse addressing");
test bool testBitConversionWithValue() = expectEqual(expectedResetValidStatements, evaluateAssign(symbols, "00321", 5), "setting this value should set bit .1 and bit .3");

test bool allSymbolDeclarations()
{
  generateProgram("AllSymbols.EXP", <convertSymbols(symbols), extractStatements(constant, symbols)>);
  return true;
}

Symbol triggerSymbol = <"TRIGGER_510.1", "00123.0", "- BDR0B23", "R_TRIG">;

// Small parts
test bool testFirstOneHundred() = testGenerating("first100.compiled");

bool testGenerating(str inputFile)
{
  processedTree = preprocess(parseCompiledFile(inputFile));
  str outputFile = "<stripFileExtension(inputFile)>.EXP";
  generateFile(outputFile, processedTree, symbols);
  return true;
}

// Simple patterns 
test bool testConvertingTrigger() = expectEqual("  TRIGGER_510_1 : R_TRIG ; (* 00123.0 - BDR0B23 *)", extractVariable(triggerSymbol), "Converting symbol with pre-filled in datatype should yield that type");
test bool testRTrigGeneration() = expectEqual(readFileLines(testFile("triggerResult.exp")), extractInformation(preprocess(parseCompiledFile("trigger.compiled")), symbols).programLines, "Generating a trigger should yield exactly this result");

// Symbol parsing
test bool testParsingSymbols()
{
  variables = convertSymbols(symbols);
  simplified = parseVariables(variables); 
  return true;
}

test bool testVariable() = expectTrue(isCorrect(parse(#Variable, "unreferenced_1:BOOL;(* 1.0 !0.1 sec. puls *)")));
test bool testComment() = expectTrue(isCorrect("(* 1.0 !0.1 sec. puls *)", #Comment));
