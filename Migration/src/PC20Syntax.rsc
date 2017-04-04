module PC20Syntax


start syntax Pds = Expression* ; //!>> [\ \t\r\n];

syntax Expression = left Label
                    | Instruction
                    ;
public layout LS = L* ;

public layout L = [\ \t\r\n]+ !>> [\ \t\r\n]
                  | PdsComment
                  ;

lexical PdsComment = "!" + [*_a-zA-Z0-9=.\ /,\t\"+?()\'|\>\<]* !>> [*_a-zA-Z0-9=.\ /,\t\"+?()\'|\>\<] ;

lexical WhiteSpace = [\t\ ]+ !>> [\t\ ];

lexical Label = WhiteSpace*+ "L" + [0-9][0-9][0-9][0-9][0-9] ; 
                
lexical Instruction = NOP
                     | TRIG
                     | EQL
                     | EQLNT
                     | SHFTL
                     | SHFTR
                     | CNTD
                     | CNTU
                     | SET0
                     | SET1
                     | STRB
                     | FTCHB
                     | FTCHC
                     | FTCHD
                     | STRD
                     | COMP
                     | AND
                     | ANDNT
                     | OR
                     | ORNT
                     | ADD
                     | SUBTR
                     | MULT
                     | DIV
                     | JSAF
                     | JSAT
                     | RET
                     | END
                     | JBRF
                     | JFRF
                     | LSTIO
                     ;
            
lexical NOP = "NOP" + Amount?;
lexical TRIG = "TRIG" + Identifier;
lexical EQL = "EQL" + Identifier;
lexical EQLNT = "EQLNT" + Identifier;
lexical SHFTL = "SHFTL" + Identifier;
lexical SHFTR = "SHFTR" + Identifier;
lexical CNTD = "CNTD" + Identifier ;
lexical CNTU = "CNTU" + Identifier;
lexical SET0 = "SET0" + Identifier;
lexical SET1 = "SET1" + Identifier;
lexical STRB = "STRB" + Identifier;
lexical FTCHB = "FTCHB" + Identifier;
lexical FTCHC = "FTCHC" + Amount;
lexical FTCHD = "FTCHD" + Identifier;                    
lexical STRD = "STRD" + Identifier;
lexical COMP = "COMP" + Identifier;
lexical AND = "AND" + Identifier;
lexical ANDNT = "ANDNT" + Identifier;
lexical OR = "OR" + Identifier;
lexical ORNT = "ORNT" + Identifier;
lexical ADD = "ADD" + Identifier;
lexical SUBTR = "SUBTR" + Identifier;
lexical MULT = "MULT" + Identifier;
lexical DIV = "DIV" + Identifier;
lexical JSAF = "JSAF" + Label ;
lexical JSAT = "JSAT" + (Identifier | Label);
lexical RET = "RET";
lexical END = "END" + Identifier;
lexical JBRF = "JBRF" + Identifier;
lexical JFRF = "JFRF" + Identifier;
lexical LSTIO = "LSTIO" + WordAddress;
                    
syntax Identifier = BitAddress | WordAddress | Variable;
lexical Amount = WhiteSpace+[0-9]+ !>> [0-9];
lexical Variable = WhiteSpace+[A-Z][A-Z_0-9,]* !>> [A-Z_0-9,]+ ; 
lexical BitAddress = WhiteSpace+[0-9]+ !>> [0-9] + "." + [0-7];
lexical WordAddress = WhiteSpace+[0-9][0-9][0-9][0-9] ;