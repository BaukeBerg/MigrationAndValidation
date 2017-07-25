module Decorator

import List;
import String;

import vis::Figure;

import utility::Debugging;
import utility::MathUtility;
import utility::StringUtility;

int lastProgramCount = -1;

Figure generateLine(str colorName, str sourceInfo) = generateLine(colorName, "black", sourceInfo);
Figure generateLine(str colorName, str fontColorName, str sourceInfo) = box(getText(fontColorName, checkSources(sourceInfo)), [size(50), fillColor(color(colorName))]); 
Figure getText(str fontColorName, str textToDisplay) = text("  <textToDisplay>", align(0,0), fontSize(20), fontColor(fontColorName));

str checkSources(str inputSources)
{
  stringTokens = split(":", inputSources);
  integers = extractIntegers(head(stringTokens));
  if(true == inLimits(1, size(integers), 2))
  {
    if(1 != (integers[0] - lastProgramCount))
    {
      handleError("Invalid program count whilst generating image: <inputSources>");
    }
    if(2 == size(integers) && (integers[0] > integers[1]))    
    {
      handleError("Program counter range is decrementing: <inputSources>");
    }
    lastProgramCount = integers[0];
  }
  else
  {
    handleError("Invalid amount of integers received: <size(integers)> in <inputSources>");
  } 
  return inputSources;
}
