module EcbHandler

import PC20Syntax;
import ParseTree;
import List;
import String;

import utility::InstructionUtility;
import utility::StringUtility;

// Module handles the specific insertion of code blocks back into the model tree
EcbPrefix composeEcbPrefix(str colorName, list[str] statements) = composeEcbPrefix(colorName, getProgramCounter(head(statements)), getProgramCounter(head(reverse(statements))));
EcbPrefix composeEcbPrefix(str colorName, int first, int last)
{
  firstLine = right("<first>", 5, "0");
  lastLine = right("<last>", 5, "0");
  strFirst = parse(#FiveDigits, firstLine);
  strLast = parse(#FiveDigits, lastLine);
  lineColor = parse(#ColorName, "++<colorName>++");
  return (EcbPrefix)`<ColorName lineColor>CodeBlock: <FiveDigits strFirst>-<FiveDigits strLast> is `; 
}

str lineInfo(ExtractedCodeBlock ECB)
{
  items = split("-", "<ECB>");
  if(2 <= size(items))
  {
    return "<parseInt(items[0])>-<parseInt(items[1])>: ";
  }
  return "ERROR: <ECB>: ";
}
