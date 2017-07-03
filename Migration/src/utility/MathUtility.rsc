module utility::MathUtility

import IO;

import util::Math;

&T limit(&T lowerBound, &T actualValue, &T upperBound) = min(max(actualValue, lowerBound), upperBound);
bool inLimits(&T lowerBound, &T actualValue, &T upperBound) = actualValue == limit(lowerBound, actualValue, upperBound);

int shiftLeft(bool initialValue, int positions) = initialValue ? shiftLeft(1, positions) : 0 ;
int shiftLeft(int initialValue, int positions) = shiftRight(initialValue, -1 * positions);
int shiftRight(int initialValue, int positions) = floor(initialValue / pow(2.0000000000000000000000000, positions));

bool getBit(int intValue, int bitPosition) = 0 < mask(intValue, shiftLeft(1,bitPosition));

int setBit(int intValue, int bitPosition) = resetBit(intValue, bitPosition) + shiftLeft(1, bitPosition);
int resetBit(int intValue, int bitPosition) = intValue - mask(intValue, shiftLeft(1, bitPosition));
int isBit(int intValue, int bitPosition, bool newValue) = (true == newValue) ? setBit(intValue, bitPosition) : resetBit(intValue, bitPosition);


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

real pow(num x, int y) = y < 0 ? 1.0 / util::Math::pow(x, y * -1) : util::Math::pow(x,y) ;
