module Decorator

import vis::Figure;

Figure generateLine(str colorName, str sourceInfo) = generateLine(colorName, "black", sourceInfo);
Figure generateLine(str colorName, str fontColorName, str sourceInfo) = box(getText(fontColorName, sourceInfo), [size(50), fillColor(color(colorName))]);

Figure getText(str fontColorName, str textToDisplay) = text("  <textToDisplay>", align(0,0), fontSize(20), fontColor(fontColorName));
