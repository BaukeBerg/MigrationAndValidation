module DataTypes

import List;

alias PatternMap = map[str patternName, int patternCount]; /// map of patterns vs count
alias PatternList = list[tuple[int patternCount, str patternName]]; /// (sorted) list of patterns

PatternList toList(PatternMap patternMap)
{
  patternList = [];
  for(pattern <- patternMap)
  {
    patternList += [<patternMap[pattern], pattern>];    
  }
  return reverse(sort(patternList));
}

alias Model = list[LogicBlock];
alias LogicBlock = tuple[SourceRange range, str name, list[Statement] conditions, list[Statement] actions];
alias SourceRange = tuple[int firstLine, int lastLine];
alias Statement = str;