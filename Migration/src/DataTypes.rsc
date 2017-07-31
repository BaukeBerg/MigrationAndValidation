module DataTypes

alias Model = list[LogicBlock];
alias LogicBlock = tuple[SourceRange range, str name, list[Statement] conditions, list[Statement] actions];
alias SourceRange = tuple[int firstLine, int lastLine];
alias Statement = str;