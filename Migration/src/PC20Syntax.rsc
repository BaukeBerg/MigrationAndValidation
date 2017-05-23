module PC20Syntax

start syntax PC20 = Expression+ ;

syntax Expression = SingleLabel 
                    | Instruction 
                    | PdsComment                                     
                    | NewLine
                    ;

start syntax PlcSymbols = Symbol+ ;

syntax Symbol = Declaration
              | UnreferencedDeclaration
              | PdsComment
              | NewLine           
              ; 

start syntax LabelList = LabelLocation+ ;

lexical LabelLocation = ComposedLabel
                      | NewLine
                      ;
                      
lexical ComposedLabel = Label + ":" + LineNumber + NewLine? !>> "\r" ;

lexical Declaration = VariableName + WhiteSpace+ "=" Address ;
lexical NewLine = "\r\n";
lexical UnreferencedDeclaration = "=" + Address ;
                    
public layout LS = [\ \t]* !>> [\ \t] ;

lexical PdsComment = "!" + [*_a-zA-Z0-9=./,\ \t\"+?()\'|\>\<]* !>> [*_a-zA-Z0-9=./,\ \t\"+?()\'|\>\<] ;


lexical WhiteSpace = [\t\ ]+ !>> [\t\ ];
lexical SingleLabel = Label;
lexical Label = "L" + [0-9][0-9][0-9][0-9][0-9] ;
lexical ProgramLine = [0-9]+ !>> [0-9] ; 
                        
lexical Instruction = AmountInstruction
                    | IdentifierInstruction
                    | PlainInstruction 
                    | NopInstruction
                    | LabelInstruction
                    ;
                     
lexical AmountInstruction = AmountInstructionName + Amount;
lexical IdentifierInstruction = IdentifierInstructionName + Identifier ;

syntax LabelInstruction = LabelInstructionName + (Label | ProgramLine) ;

lexical PlainInstruction = "RET" ;
lexical NopInstruction = "NOP" + Amount?;
                                     
lexical AmountInstructionName = "FTCHC" ;
lexical IdentifierInstructionName = "TRIG"   // 01 Rising Edge Detection
                                  | "EQL"    // 02 "EQUALS"
                                  | "EQLNT"  // 03 "NOT" Equal
                                  | "SHFTL"  // 04 Shift "LEFT"
                                  | "SHFTR"  // 05 Shift "RIGHT"
                                  | "CNTD"   // 06 Count "DOWN" 
                                  | "CNTU"   // 07 Count "UP"
                                  | "SET0"   // 08 Disable bit
                                  | "SET1"   // 09 Enable bit
                                  | "STRB"   // 10 Store Bt
                                  | "FTCHB"  // 11 Fetch Bit                                  
                                  | "FTCHD"  // 13 Fetch Digit
                                  | "STRD"   // 14 Store Digit
                                  | "COMP"   // 15 Compare                 
                                  | "AND"    // 16 "AND"
                                  | "ANDNT"  // 17 "AND" "NOT"
                                  | "OR"     // 18 "OR"
                                  | "ORNT"   // 19 "OR" "NOT"
                                  | "ADD"    // 20 "ADD"
                                  | "SUBTR"  // 21 "SUBTRACT"
                                  | "MULT"   // 22 "MULTIPLY"
                                  | "DIV"    // 23 "DIVIDE"    
                                  | "END"    // 27 End of "IO" handling
                                  | "LSTIO"  // 31 La"ST" Input or Output                                  
                                  ;

lexical LabelInstructionName = "JSAF"   // 24 Jump to Subroutine, Absolute FALSE
                             | "JSAT"   // 25 Jump to Subroutine, Absolute TRUE
                             | "JBRF"   // 29 Jump Backwards, Relative FALSE
                             | "JFRF"   // 30 Jump Forwards, Relative FALSE                             
                             ;
                                   
syntax Identifier = Address | Variable;
syntax Address = BitAddress | WordAddress ; 
lexical BitAddress = WhiteSpace+[0-9]+ !>> [0-9] + "." + [0-7];
lexical WordAddress = WhiteSpace+[0-9][0-9][0-9][0-9] ;
lexical Variable = WhiteSpace+ + VariableName ;
lexical VariableName = [A-Z][A-Z_0-9,]* !>> [A-Z_0-9,]+ !>> [A-Z_0-9] ;
lexical Amount = WhiteSpace+[0-9]+ !>> [0-9]; 
lexical LineNumber = WhiteSpace* !>> WhiteSpace + [0-9]+ !>> [0-9] ; 