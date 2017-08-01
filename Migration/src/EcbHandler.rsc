module EcbHandler

import DataTypes;
import PC20Syntax;
import ParseTree;
import List;
import String;

import utility::Debugging;
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

SourceLineRange composeSourceLineRange(SourceRange sourceRange) = composeSourceLineLange(sourceRange.firstLine, sourceRange.lastLine);
SourceLineRange composeSourceLineRange(int firstLine, int lastLine) = parse(#SourceLineRange, "<right("<firstLine>", 5, "0")>-<right("<lastLine>", 5, "0")>");

SourceRange composeSourceRange(&T firstBlock, &T secondBlock) = <composeSourceRange(firstBlock).firstLine, composeSourceRange(secondBlock).lastLine>;
SourceRange composeSourceRange(&T codeBlock) 
{
  visit(codeBlock)
  {
    case(SourceLineRange)`<FiveDigits firstLine>-<FiveDigits lastLine>`:
    {
      return <parseInt(firstLine), parseInt(lastLine)>;
    }    
    default:
    {
      ; // Required in order to make concrete syntax match
    }
  }  
  return <-1,-1>;
}

