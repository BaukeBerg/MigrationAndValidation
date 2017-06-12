module PC20Syntax

start syntax PC20_Assembled = AssembledInstruction+;

syntax AssembledInstruction = FileHeader
                            | InstructionLine
                            | FileEnd
                            ;
                            
lexical FileHeader = "S0030000FC" NewLine ;
lexical FileEnd = "S9030000FC" NewLine ;

lexical InstructionLine = LineHeader Instruction+ Checksum NewLine ; 
                        
lexical LineHeader = "S1" InstructionAmount PlcAddress "0" ;
lexical PlcAddress = HexChar HexChar HexChar ;
lexical InstructionAmount = HexChar HexChar ;  
                           
lexical Instruction = HexChar HexChar HexChar HexChar ;
lexical Checksum = HexChar HexChar ;

lexical HexChar = [0-9A-F];                         

start syntax PC20_Compiled = CompiledInstruction+ ;

syntax CompiledInstruction = EmptyLine
//                           | StateTransition                           
                             > BitInstruction
                             | WordInstruction
                             | SingleInstruction
                           ;

lexical EmptyLine = SourceLineNumber NewLine ;

lexical BitInstruction = InstructionPrefix BitAddress NewLine ;
lexical WordInstruction = InstructionPrefix WordAddress NewLine ;
lexical SingleInstruction = InstructionPrefix NewLine ;

lexical InstructionPrefix = SourceLineNumber ProgramLineNumber InstructionNumber ;

lexical ProgramLineNumber = FiveDigits WhiteSpace ;
lexical SourceLineNumber = FiveDigits WhiteSpace;

lexical InstructionNumber = [0-3][0-9] WhiteSpace;
lexical BitAddress = FiveDigits "." [0-3] WhiteSpace;
lexical WordAddress = FiveDigits WhiteSpace;

lexical FiveDigits = [0-9][0-9][0-9][0-9][0-9] ;

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

lexical PlainInstruction = ret:"RET" ;
lexical NopInstruction = noOperation:"NOP" + Amount?; // 00 No operation
                                     
lexical AmountInstructionName = fetchConstant:"FTCHC" ; // 12 Fetch Constant

lexical IdentifierInstructionName = risingEdge:"TRIG"   // 01 Rising Edge Detection
                                  | equal:"EQL"    // 02 "EQUALS"
                                  | notEqual:"EQLNT"  // 03 "NOT" Equal
                                  | shiftLeft:"SHFTL"  // 04 Shift "LEFT"
                                  | shiftRight:"SHFTR"  // 05 Shift "RIGHT"
                                  | countDown:"CNTD"   // 06 Count "DOWN" 
                                  | countUp:"CNTU"   // 07 Count "UP"
                                  | resetBit:"SET0"   // 08 Disable bit
                                  | setBit:"SET1"   // 09 Enable bit
                                  | storeBit:"STRB"   // 10 Store Bt
                                  | fetchBit:"FTCHB"  // 11 Fetch Bit                                  
                                  | fetchDigit:"FTCHD"  // 13 Fetch Digit
                                  | storeDigit:"STRD"   // 14 Store Digit
                                  | compare:"COMP"   // 15 Compare                 
                                  | and:"AND"    // 16 "AND"
                                  | andNot:"ANDNT"  // 17 "AND" "NOT"
                                  | or:"OR"     // 18 "OR"
                                  | orNot:"ORNT"   // 19 "OR" "NOT"
                                  | add:"ADD"    // 20 "ADD"
                                  | subtract:"SUBTR"  // 21 "SUBTRACT"
                                  | multiply:"MULT"   // 22 "MULTIPLY"
                                  | divide:"DIV"    // 23 "DIVIDE"    
                                  | end:"END"    // 27 End of "IO" handling
                                  | lastInputOutput:"LSTIO"  // 31 La"ST" Input or Output                                  
                                  ;

lexical LabelInstructionName = subRoutineAbsoluteFalse:"JSAF"   // 24 Jump to Subroutine, Absolute FALSE
                             | subRoutineAbsoluteTrue:"JSAT"   // 25 Jump to Subroutine, Absolute TRUE
                             | backwardRelativeFalse:"JBRF"   // 29 Jump Backwards, Relative FALSE
                             | forwardRelativeFalse:"JFRF"   // 30 Jump Forwards, Relative FALSE                             
                             ;
                                   
syntax Identifier = Address | Variable;
syntax Address = BitAddress | WordAddress ; 
lexical BitAddress = WhiteSpace+[0-9]+ !>> [0-9] + "." + [0-7];
lexical WordAddress = WhiteSpace+[0-9][0-9][0-9][0-9] ;
lexical Variable = WhiteSpace+ + VariableName ;
lexical VariableName = [A-Z][A-Z_0-9,]* !>> [A-Z_0-9,]+ !>> [A-Z_0-9] ;
lexical Amount = WhiteSpace+[0-9]+ !>> [0-9]; 
lexical LineNumber = WhiteSpace* !>> WhiteSpace + [0-9]+ !>> [0-9] ; 