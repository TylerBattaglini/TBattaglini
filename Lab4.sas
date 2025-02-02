

libname week9 'C:\Users\rgallop\Documents\SMSTATCOMPUTER\WCULaptop\STA311\ONLINE\Topic9';


data demogr;
set week9.demogr;
run;

proc print data=demogr;
quit;

proc contents data=demogr;
quit;


/*
Gender:         M (1)____     F(2)_____                    Age:_____
Marital Status:  ___   Single(1)
        ____  Married(2)
        ____  Divorced(3)
        ____  Separated(4)
        ____  Widowed(5)
        ____  Cohabitating(6)

Race:           ____ American Indian or Alaskan Native(1)       ____ Asian (4)
                ____ Black or African American(2)               ___ Native Hawaiian or other Pacific Islander (5)
                ____ White(3)                                   ____ Other or unknown (6)

*/



proc freq data=demogr;
tables gender;
quit;



data demogr;
set demogr;

gender2=input(gender,2.);


gender3=input(gender,2.);


if upcase(gender)='F' then gender2 = 2;
if upcase(gender)='FEMALE' then gender2 = 2;
if upcase(gender)='M' then gender2 = 1;
if upcase(gender)='MALE' then gender2 = 1;

if upcase(gender) in: ('F') then gender3 = 2;  ****in: tells SAS if the value starts with a capital F***;
if upcase(gender) in: ('M') then gender3 = 1;**in: tells SAS if the value starts with a capital M***;


run;



proc freq data=demogr;
tables gender*gender2/list;
tables gender*gender3/list;
tables gender*gender2*gender3/list missing;
quit;


proc contents data=demogr ;
quit;

proc print data=demogr;
var gender gender2;
quit;



proc freq data=demogr;
tables marital;
quit;



data demogr;
set demogr;
/*
Marital Status:  ___   Single(1)
        ____  Married(2)
        ____  Divorced(3)
        ____  Separated(4)
        ____  Widowed(5)
        ____  Cohabitating(6)
*/


marital2 = input(marital, 2.);
if upcase(marital)in: ('SI') then marital2 = 1;
if upcase(marital)in: ('M') then marital2 = 2;
if upcase(marital)in: ('SE') then marital2 = 4;
if upcase(marital)in: ('W') then marital2 = 5;
if upcase(marital)in: ('C') then marital2 = 6;
if upcase(marital) in: ('D') then marital2 = 3;
if upcase(marital) in: ('DIVORCED/') then marital2 = . ;



run;

proc freq data=demogr;
tables marital*marital2/list missing;
quit;

***TRY the Race****;
