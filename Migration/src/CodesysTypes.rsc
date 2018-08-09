module CodesysTypes

import List;

alias PlcProgram = tuple[Variables declarations, Statements programLines];
alias Variables = list[str];
alias Statements = list[str];
alias PatternList = map[str patternName, int patternCount];

// Sample skeleton provied by Davy Landman
//data PLCProgram
//   = program(list[Declaration] decls, list[Statement] stms);
//   
//data Declaration
//   = variable(..)
//   | timer(...)
//   ;