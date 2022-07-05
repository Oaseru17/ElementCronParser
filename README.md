# Cron Parser

This project contains the cron parser project for element

**Project structure**
This section contains the various folder description
Core: Contains the core logic of the tool
Config: The configuration related class
Extension: All extension used
Resources: Any resources to be used in the project
Util: All helper and util files 

**How to run**
There are two ways to run project 

1. Update the application arguments and click run
2. Navigate to the project root and enter `swift run cronparser HH:MM` e.g `swift run cronparser 19:05`

**Edge cases.
Various edge cases have been considered example 24:00, 12:60, 24:01

**Assumption** 
12:60 == 13:00,
24:00 == 00.00,
24:60 = wronginput,
00:60 == 1:00,

Also, if single digit can be convert to the hour this is corrected internal
example 8:32 is still value 

**What I will add with more time**
1. Add a better validator for script 
2. Allow users to add cron jobs
3. Add more test coverage

