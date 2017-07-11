module utility::StringUtility

import String;

import utility::MathUtility;

int parseInt(&T inputObject)
{
  inputString = "<inputObject>";
  try
  { 
    return toInt(firstInteger(inputString));
  }
  catch:
  {     
    return -1;
  }
}

public str firstInteger(str inputString)
{
  isHex = isHexaDecimal(inputString);
  newString = "";
  for(n <- [firstNumeric(inputString) .. size(inputString)])
  {
    char = toLowerCase(inputString[n]);
    if((inLimits("0", char, "9"))
      || (isHex && inLimits("a", char, "f")))
    {
      newString += char;
      continue;
    }
    break;
  }
  newString = stripLeading(newString, "0");
  return isHex ? "0x" + newString : newString;
}

bool isHexaDecimal(str stringToCheck) = -1 == firstHex(stringToCheck) ? false : firstNumeric(stringToCheck) - 2 == firstHex(stringToCheck);
int firstNumeric(str stringToCheck) = findDecimal(stringToCheck, firstHex(stringToCheck));
int firstHex(str stringToCheck) = findFirst(stringToCheck, "0x"); 

int findDecimal(str stringToCheck, int firstHexPos)
{
  for(n <- [0 .. size(stringToCheck)], inLimits("0", stringToCheck[n], "9") && n != firstHexPos)
  {
    return n;
  }
  return -1;
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