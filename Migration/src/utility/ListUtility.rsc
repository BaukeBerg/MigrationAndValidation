module \utility::ListUtility

import String;
import List;

bool contains(list[&T] items, &T item) = -1 != indexOf(items, item);

list[str] trimList(list[str] linesToTrim, str tokenToSplit)
{
  results = [];
  for(line <- linesToTrim, 1 < size(split(tokenToSplit, line)))
  {
    results += line; 
  }
  return results;
}

list[str] trimList(list[str] linesToTrim)
{
  list[str] results = [];
  for(line <- linesToTrim, "" != trim(line))
  {
    results += trim(line);
  }
  return results;
}

list[str] padList(str prefix, list[str] lines, str suffix) = ["<prefix><line><suffix>" | line <- lines];

// Join list to plain string
str joinList(list[&T] lines) = joinList(lines, "\r\n");
str joinList(list[&T] lines, str token)
{
  str result = "";
  for(line <- lines)
  {
    result += "<line><token>"; 
  }
  return replaceLast(result, token, "");
}