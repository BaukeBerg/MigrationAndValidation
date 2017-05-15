module utility::MathUtility

import util::Math;

&T limit(&T lowerBound, &T actualValue, &T upperBound) = min(max(actualValue, lowerBound), upperBound);
bool inLimits(&T lowerBound, &T actualValue, &T upperBound) = actualValue == limit(lowerBound, actualValue, upperBound);