module PdsSyntax

start syntax Pds = Expression+;


public layout LS = L* ;

syntax L 
  = [\ \t\n\r]
  | Comment
  ;

syntax Expression = left RoutineCondition
                    | Statement
                   // | Comment
                    ; 

syntax Comment = "!" + [a-zA-Z0-9]+ !>> [\n];

syntax RoutineCondition = Label + "AND" + Address ;
lexical Label = "L" + [0-9][0-9][0-9][0-9][0-9] ; // >> [0-9]+; // Label is an L with 5 numeric digits

syntax Statement = Instruction + Identifier;
                 
lexical Instruction = "FTCHD" 
                    | "COMP" 
                    | "STRD" 
                    | "STRB"
                    | "JFRF"
                    | "AND" 
                    | "ANDNT" 
                    | "NOP"
                    ;
                    
syntax Identifier = Address | Variable ;
lexical Variable = [A-Z][a-zA-Z_0-9]* !>> [A-Z_0-9]+ ; 
syntax Address = WordAddress
               | BitAddress
               ;
               
lexical BitAddress = [0-9]+ + "." + [0-7];
lexical WordAddress = [0-9][0-9][0-9][0-9] ;