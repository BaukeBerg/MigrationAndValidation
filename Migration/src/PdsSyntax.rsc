module PdsSyntax

extend lang::std::Layout;

start syntax Pds = Expression+;

syntax Expression = left RoutineCondition
                    | Instruction
                    | PdsComment
                    ; 

//public layout Comment = PdsComment+;

lexical PdsComment = "!" + [a-zA-Z0-9=.\ ]+ !>> [a-zA-Z0-9=.\ ];
syntax RoutineCondition = Label + "AND" + Address ;

lexical Label = "L" + [0-9][0-9][0-9][0-9][0-9] ; 
                
lexical Instruction = "FTCHD" + Identifier
                    | "COMP" + Identifier
                    | "STRD" + Identifier
                    | "STRB" + Identifier
                    | "JFRF" + Identifier
                    | "AND" + Identifier
                    | "ANDNT" + Identifier
                    | "NOP" + Amount
                    ;
                    
syntax Identifier = [\ ]+ + (Address | Variable );
lexical Amount = [\ ]+[0-9]+ !>> [0-9];
lexical Variable = [A-Z][A-Z_0-9]* !>> [A-Z_0-9]+ ; 
syntax Address = WordAddress
               | BitAddress
               ;
               
lexical BitAddress = [0-9]+ !>> [0-9] + "." + [0-7];
lexical WordAddress = [0-9][0-9][0-9][0-9] ;