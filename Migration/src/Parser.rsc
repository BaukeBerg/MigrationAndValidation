module Parser

extend ParserBase;

import PC20Syntax;

public int parseSourceFile() = parsePdsSource("DR_TOT_3.PRG");
public int parseSymbolTable() = parsePdsSymbols("DR_TOT_3.SYM");

public int parsePdsSource(str fileName) = parseFile(fileName, #start[PC20]);
public int parsePdsSymbols(str fileName) = parseFile(fileName, #start[PlcSymbols]);

public Tree generateSourceTree(str fileName) = doParse(fileName, #start[PC20]);
public Tree generateSymbolTree(str fileName) = doParse(fileName, #start[PlcSymbols]);
