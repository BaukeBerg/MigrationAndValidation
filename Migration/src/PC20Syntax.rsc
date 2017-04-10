module PC20Syntax

start syntax PC20 = Expression+ ;

syntax Expression = Label
                    | Instruction
                    | PdsComment
                    ;
public layout LS = [\ \t\r\n]* !>> [\ \t\r\n]
                   ;

lexical PdsComment = "!" + [*_a-zA-Z0-9=./,\ \t\"+?()\'|\>\<]* !>> [*_a-zA-Z0-9=./,\ \t\"+?()\'|\>\<] ;

lexical WhiteSpace = [\t\ ]+ !>> [\t\ ];

lexical Label = "L" + [0-9][0-9][0-9][0-9][0-9] ; 
                        
lexical Instruction = NOP_INST      // 00 No-operation
                      | TRIG_INST   // 01 Rising Edge Detection
                      | EQL_INST    // 02 EQUALS
                      | EQLNT_INST  // 03 NOT Equal
                      | SHFTL_INST  // 04 Shift LEFT
                      | SHFTR_INST  // 05 Shift RIGHT
                      | CNTD_INST   // 06 Count DOWN 
                      | CNTU_INST   // 07 Count UP
                      | SET0_INST   // 08 Disable bit
                      | SET1_INST   // 09 Enable bit
                      | STRB_INST   // 10 Store Bt
                      | FTCHB_INST  // 11 Fetch Bit
                      | FTCHC_INST  // 12 Fetch Constant
                      | FTCHD_INST  // 13 Fetch Digit
                      | STRD_INST   // 14 Store Digit
                      | COMP_INST   // 15 Compare                 
                      | AND_INST    // 16 AND
                      | ANDNT_INST  // 17 AND NOT
                      | OR_INST     // 18 OR
                      | ORNT_INST   // 19 OR NOT
                      | ADD_INST    // 20 ADD
                      | SUBTR_INST  // 21 SUBTRACT
                      | MULT_INST   // 22 MULTIPLY
                      | DIV_INST    // 23 DIVIDE      
                      | JSAF_INST   // 24 Jump to Subroutine, Absolute FALSE
                      | JSAT_INST   // 25 Jump to Subroutine, Absolute TRUE
                      | RET_INST    // 26 RETURN
                      | END_INST    // 27 END
                      | JBRF_INST   // 29 Jump Backwards, Relative FALSE
                      | JFRF_INST   // 30 Jump Forwards, Relative FALSE
                      | LSTIO_INST  // 31 LaST Input or Output
                      ;

lexical NOP_INST = NOP + Amount?;
lexical TRIG_INST = TRIG + Identifier;
lexical EQL_INST = EQL + Identifier;
lexical EQLNT_INST = EQLNT + Identifier;
lexical SHFTL_INST = SHFTL + Identifier;
lexical SHFTR_INST = SHFTR + Identifier;
lexical CNTD_INST = CNTD + Identifier ;
lexical CNTU_INST = CNTU + Identifier;
lexical SET0_INST = SET0 + Identifier;
lexical SET1_INST = SET1 + Identifier;
lexical STRB_INST  = STRB + Identifier;
lexical FTCHB_INST = FTCHB + Identifier;
lexical FTCHC_INST = FTCHC + Amount;
lexical FTCHD_INST = FTCHD + Identifier;                    
lexical STRD_INST = STRD + Identifier;
lexical COMP_INST = COMP + Identifier;
lexical AND_INST = AND + Identifier;
lexical ANDNT_INST = ANDNT + Identifier;
lexical OR_INST = OR + Identifier;
lexical ORNT_INST = ORNT + Identifier;
lexical ADD_INST = ADD + Identifier;
lexical SUBTR_INST = SUBTR + Identifier;
lexical MULT_INST = MULT + Identifier;
lexical DIV_INST = DIV + Identifier;
lexical JSAF_INST = JSAF + Label ;
lexical JSAT_INST = JSAT + (Identifier | Label);
lexical RET_INST = RET;
lexical END_INST = END + Identifier;
lexical JBRF_INST = JBRF + Identifier;
lexical JFRF_INST = JFRF + Identifier;
lexical LSTIO_INST = LSTIO + WordAddress;
                                   
lexical InstructionName = NOP     // 00 No-operation
                        | TRIG   // 01 Rising Edge Detection
                        | EQL    // 02 EQUALS
                        | EQLNT  // 03 NOT Equal
                        | SHFTL  // 04 Shift LEFT
                        | SHFTR  // 05 Shift RIGHT
                        | CNTD   // 06 Count DOWN 
                        | CNTU   // 07 Count UP
                        | SET0   // 08 Disable bit
                        | SET1   // 09 Enable bit
                        | STRB   // 10 Store Bt
                        | FTCHB  // 11 Fetch Bit
                        | FTCHC  // 12 Fetch Constant
                        | FTCHD  // 13 Fetch Digit
                        | STRD   // 14 Store Digit
                        | COMP   // 15 Compare                 
                        | AND    // 16 AND
                        | ANDNT  // 17 AND NOT
                        | OR     // 18 OR
                        | ORNT   // 19 OR NOT
                        | ADD    // 20 ADD
                        | SUBTR  // 21 SUBTRACT
                        | MULT   // 22 MULTIPLY
                        | DIV    // 23 DIVIDE      
                        | JSAF   // 24 Jump to Subroutine, Absolute FALSE
                        | JSAT   // 25 Jump to Subroutine, Absolute TRUE
                        | RET    // 26 RETURN
                        | END    // 27 END
                        | JBRF   // 29 Jump Backwards, Relative FALSE
                        | JFRF   // 30 Jump Forwards, Relative FALSE
                        | LSTIO  // 31 LaST Input or Output
                        ;

lexical NOP = "NOP";
lexical TRIG = "TRIG";
lexical EQL = "EQL";
lexical EQLNT = "EQLNT";
lexical SHFTL = "SHFTL";
lexical SHFTR = "SHFTR";
lexical CNTD = "CNTD";
lexical CNTU = "CNTU";
lexical SET0 = "SET0";
lexical SET1 = "SET1";
lexical STRB = "STRB";
lexical FTCHB = "FTCHB";
lexical FTCHC = "FTCHC";
lexical FTCHD = "FTCHD";
lexical STRD = "STRD";
lexical COMP = "COMP";
lexical AND = "AND";
lexical ANDNT = "ANDNT";
lexical OR = "OR";
lexical ORNT = "ORNT";
lexical ADD = "ADD";
lexical SUBTR = "SUBTR";
lexical MULT = "MULT";
lexical DIV = "DIV";
lexical JSAF = "JSAF";
lexical JSAT = "JSAT";
lexical RET = "RET";
lexical END = "END";
lexical JBRF = "JBRF";
lexical JFRF = "JFRF";
lexical LSTIO = "LSTIO";
    
                    
syntax Identifier = BitAddress | WordAddress | Variable;
lexical Amount = WhiteSpace+[0-9]+ !>> [0-9];
lexical Variable = WhiteSpace+[A-Z][A-Z_0-9,]* !>> [A-Z_0-9,]+ ; 
lexical BitAddress = WhiteSpace+[0-9]+ !>> [0-9] + "." + [0-7];
lexical WordAddress = WhiteSpace+[0-9][0-9][0-9][0-9] ;