module testModule::TestDebugging

import DateTime;

import utility::Debugging;

// Not real tests, just calling the functions to make sure no exceptions are buried in the module.
// Also these 'tests' can serve as a way to show users how to use these modules.

test bool testDateTimeCalls()
{
  startDuration();
  printDuration();
  printDuration("Second call");
  datetime theTime = now();
  printDuration("With argument", theTime);
  printDuration(theTime);
  return true; 
}

test bool testDebugPrinting()
{
  bool iWillNotBePrintedWhenFalse = true;
  debugPrint("Hello, I am debug output");
  debugPrint("Optionally, you can supply me a boolean which whill suppress output when false", iWillNotBePrintedWhenFalse);
  return true;
}

test bool testGenericMethod()
{
  datetime theTime = now();
  debugPrint(theTime);
  debugPrint(theTime, false);
  return true;
}
