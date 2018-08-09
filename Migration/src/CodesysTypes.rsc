module CodesysTypes

import List;

alias PlcProgram = tuple[Variables declarations, Statements programLines, int initLineCount];
alias Variables = list[str];
alias Statements = list[str];

// Sample skeleton provied by Davy Landman
//data PLCProgram
//   = program(list[Declaration] decls, list[Statement] stms);
//   
//data Declaration
//   = variable(..)
//   | timer(...)
//   ;