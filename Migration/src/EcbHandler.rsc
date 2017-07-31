module EcbHandler

import DataTypes;
import PC20Syntax;
import ParseTree;
import List;
import String;

import utility::InstructionUtility;
import utility::StringUtility;

// Module handles the specific insertion of code blocks back into the model tree
EcbPrefix composeEcbPrefix(str colorName, list[str] statements) = composeEcbPrefix(colorName, getProgramCounter(head(statements)), getProgramCounter(head(reverse(statements))));
EcbPrefix composeEcbPrefix(str colorName, SourceRange range) = composeEcbPrefix(colorName, range.firstLine, range.lastLine);
private EcbPrefix composeEcbPrefix(str colorName, int first, int last)
{
  lineColor = parse(#ColorName, "++<colorName>++");  
  sourceRange = composeSourceRange(first, last);
  return (EcbPrefix)`<ColorName lineColor>CodeBlock: <SourceLineRange sourceRange> is `; 
}

SourceLineRange composeSourceRange(int firstLine, int lastLine) = parse(#SourceLineRange, "<right("<firstLine>", 5, "0")>-<right("<lastLine>", 5, "0")>");
 
str lineInfo(ExtractedCodeBlock ECB)
{
  items = split("-", "<ECB>");
  if(2 <= size(items))
  {
    return "<parseInt(items[0])>-<parseInt(items[1])>: ";
  }
  return "ERROR: <ECB>: ";
}
