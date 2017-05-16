module utility::DateTime

// Added utility for formatting due to issues with the rascal date time library
// default formatters
datetime parseIsoDate(str date) = parseDate(date, "yyyy-MM-dd");
str printIsoDate(datetime date) = ("<date.year>-<right("<date.month>", 2, "0")>-<right("<date.day>", 2, "0")>");
