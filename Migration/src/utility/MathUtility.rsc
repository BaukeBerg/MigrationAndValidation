module utility::MathUtility

import IO;

import util::Math;

&T limit(&T lowerBound, &T actualValue, &T upperBound) = min(max(actualValue, lowerBound), upperBound);
bool inLimits(&T lowerBound, &T actualValue, &T upperBound) = actualValue == limit(lowerBound, actualValue, upperBound);

int shiftLeft(int initialValue, int positions) = shiftRight(initialValue, -1 * positions);
int shiftRight(int initialValue, int positions) = floor(initialValue / pow(2.0000000000000000000000000, positions));

int mask(int initialValue, int maskValue)
{
  totalValue = 0;
  for(i <- [64..-1])
  {
    compareValue = shiftLeft(1,i);
    initLarger = false;
    if(initialValue >= compareValue)
    {
      initialValue -= compareValue;
      initLarger = true;
    }
    if(maskValue >= compareValue)
    {
      maskValue -= compareValue;
      if(initLarger)
      {
        totalValue += compareValue;
      }
    }  
  }
  return totalValue;
}

