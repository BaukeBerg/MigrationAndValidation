module Decorator

import List;
import String;

import vis::Figure;

import utility::Debugging;
import utility::MathUtility;
import utility::StringUtility;

Figure generateLineFigure(str colorName, str fontColorName, str sourceInfo) = box(getText(fontColorName, sourceInfo), [size(50), fillColor(color(colorName))]); 
Figure getText(str fontColorName, str textToDisplay) = text("  <textToDisplay>", align(0,0), fontSize(20), fontColor(fontColorName));
