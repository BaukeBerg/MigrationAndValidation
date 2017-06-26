module utility::StringUtility

import String;

int parseInt(&T inputObject)
{
  inputString = "<inputObject>";
  try
  { 
    inputString = trim(inputString);
    return toInt(stripLeading(inputString, "0"));
  }
  catch:
  {
    return -1;
  }
}

public str stripLeading(str inputString, str tokenToRemove)
{
  while(size(tokenToRemove) < size(inputString) && startsWith(inputString, tokenToRemove))
  {
    inputString = substring(inputString,size(tokenToRemove));
  }
  return inputString;
}

public str stringToken(str stringToCheck, str firstOccurrence, str lastOccurrence) = stringToken(stringToCheck, firstOccurrence, findLast(stringToCheck, lastOccurrence));
public str stringToken(str stringToCheck, int firstPosition, str lastOccurrence) = stringToken(stringToCheck, firstPosition, findLast(stringToCheck, lastOccurrence));
public str stringToken(str stringToCheck, str firstOccurrence, int lastPosition) = stringToken(stringToCheck, findFirst(stringToCheck, firstOccurrence)+size(firstOccurrence), lastPosition);
public str stringToken(str stringToCheck, int firstPosition, int lastPosition) = substring(stringToCheck, firstPosition, lastPosition); // only provided for convenience

public str clipString(str stringToClip, str startToken, str endToken) = clipString(stringToClip, findFirst(stringToClip, startToken), findFirst(stringToClip, endToken) + size(endToken), "");
public str clipString(str stringToClip, str startToken, str endToken, str splitToken) = clipString(stringToClip, findFirst(stringToClip, startToken), findFirst(stringToClip, endToken) + size(endToken), splitToken);
public str clipString(str stringToClip, int startPos, int endPos) = clipString(stringToClip, startPos, endPos, ""); 
public str clipString(str stringToClip, int startPos, int endPos, str split) = substring(stringToClip, 0, startPos) + split + substring(stringToClip, endPos);