module utility::lang::symbol::Syntax

layout LS = [\ \t \n \r]* !>> [\ \t \n \r];

start syntax SymbolTable = SymbolDeclaration* symbols;

syntax SymbolDeclaration
  = named: Label name "=" Address addr Comment? comment 
  | unnamed: "=" Address addr Comment? comment
  ;
  
lexical Label = [a-zA-Z_] [a-zA-Z0-9_,]* !>> [a-zA-Z0-9_,];

lexical Address
  = bit: [0-9]+ "." [0-3]
  | integer: [0-9]+ !>> [0-9]
  ;
  
lexical Comment
  = "!" ![\n]* $;