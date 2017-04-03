module PdsSyntax

start syntax Pds = RoutineCondition+;


public layout LS = L* ;

syntax L 
  = [,\ \t\n\r]*
  | Comment
  ;

syntax Comment = "!" + [a-zA-Z0-9.]+;
syntax RoutineCondition = Label + AND + Address ;
lexical Label = "L" + [0-9][0-9][0-9][0-9][0-9] ; // >> [0-9]+; // Label is an L with 5 numeric digits
lexical AND = "AND";
syntax Address = [0-9]+ !>> [0-9] + "." + [0-7] ;

syntax Statement = Instruction;
lexical Instruction = "FTCHD" 
                    | "COMP" 
                    | "STRB" 
                    | "JFRF"
                    ;
syntax Identifier = Address | Variable ;
lexical Variable = [0-9a-zA-Z]+ !>> [0-9a-zA-Z]+ ; 
syntax Address = [0-9]+ >> "." >> [0-9];