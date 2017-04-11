module utility::FileUtility

import FileLocations;
import IO;
import List;
import String;

import utility::ListUtility;
import utility::StringUtility;

list[loc] enumerateDirFiles(str sampleSubDir) = EnumerateDirFiles(toLocation("<sampleDir><sampleSubDir>"));
list[loc] enumerateDirFiles(loc folderLoc)
{
  list [loc] locationList = [];
  if(true == exists(folderLoc))
  {
    list[loc] filesFolders = folderLoc.ls;
    for (int n <- [0 .. size(filesFolders)])
    {
  	  if (isDirectory(filesFolders[n]))
  	  {
  	    locationList += enumerateDirFiles(filesFolders[n]);
  	  }
  	  else
  	  {
  	    locationList += filesFolders[n];
  	  }  
    }
  }
  return locationList;
}

bool isDirectory(loc path) = (-1 == findLast(path.path, "."));

list[str] stripFileExtension(list[str] files) = [ stripFileExtension(file) | file <- files];
str stripFileExtension(str file) = substring(file, 0, findLast(file, "."));

list[str] fileName(list[loc] Files) = [ fileName(file.path) | file <- Files];
list[str] fileName(list[str] files) = [ FileName(name) | name <- Files] ;
str fileName(loc fileToCheck) = fileName(fileToCheck.path);
str fileName(str totalPath)
{
  int lastSlash = findLast(totalPath, "/");
  if(-1 != lastSlash)
  {
    return substring(totalPath, lastSlash+1);
  }
  return totalPath;
}

void resetFile(loc file)
{
  if(exists(file))
  {
    writeFile(file, "");
  }
}

void writeToFile(loc file, list[str] text)
{
  resetFile(file);
  addToFile(file, text);
}

void addToFile(loc file, list[str] text)
{
  for(line <- text)
  {
    addToFile(file, "<line>\r\n");
  }
}

void addToFile(loc file, str text) = exists(file) ? appendToFile(file, text) : writeFile(file, text);


