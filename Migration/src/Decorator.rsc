module Decorator

import vis::Figure;

Figure generateLine(str colorName, str sourceInfo) = box(getText(sourceInfo), [size(50), fillColor(color(colorName))]);

Figure getText(str textToDisplay) = text(textToDisplay, fontSize(20), fontColor("black"));
