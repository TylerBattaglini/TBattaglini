
*****PART 1 BEGIN ***************;
        ****************If-Then Statements*******;
data grade;
  input subject  gender $  exam1  exam2 hwgrade $;
datalines;
10 M 80 84 A
 7 M 85 89 A
 4 F 90 86 B
;
run;

*to subset the data ;


/*  IF-THEN  */

data male_grade;
set grade;
*if gender = 'M';
if gender = 'F' then delete;  ***we're saying to sas if gender is female then delete the observation****;

run;
data male_grade;
set grade;
if gender = 'M';  ****performs the same task as above.   What we're telling sas to do
                                                only retain observations where that condition is true****;
*if gender = 'F' then delete;
run;


data male_grade;
set grade;
if gender EQ 'M';  ****performs the same task as above.   What we're telling sas to do
                                                only retain observations where that condition is true****;
*if gender = 'F' then delete;
run;



data male_grade;
set grade;
if gender NE 'F';  ****performs the same task as above.   What we're telling sas to do
                                                only retain observations where that condition is true****;
*if gender = 'F' then delete;
run;

/*
=         EQ
^=, ~=   NE
>         GT
<         LT
>=        GE
<=        LE


*/

proc print data=male_grade;
quit;

/*
IF condition1 and(or) condition2 THEN DO
             action;
             action;
END;

*/



data sportscar;
  input model $ year make $ seat;
  if year < 1975 then status='classic';
  if model='Corvette' or model='Camaro' then make='Chevy';
  if model='Miata' then do;
        make = 'Mazda';
        seat = 2;
                                                end;
datalines;
Corvette 1955 .      2
Mustang  1966 Ford   4
Miata    2002 .      .
Camaro   1990 .      4
;
run;

proc print;
title 'My collection of used sports cars';
quit;






data sportscar;
  input model $ year make $ seat;
  if year < 1975 then status='classic';
  if model='Corvette' or model='Camaro' then make='Chevy';
  if model='Miata' then do;
        make = 'Mazda';
        seat = 2;
   end;
datalines;
Corvette 1955 .      2
Mustang  1966 Ford   4
Miata    2002 .      .
Camaro   1990 .      4
Pinto      .  Ford   3
;
run;
                                        ******SAS looks at the missing year for the Pinto.
                                                        SAS will say the Missing is less than 1975.
                                                        SAS sees a missing numeric value as smaller than everything;


proc print;
title 'My collection of used sports cars';
quit;



data sportscar;
  input model $ year make $ seat;
  if year < 1975 and year ne .  then status='classic';
  if model='Corvette' or model='Camaro' then make='Chevy';
  if model='Miata' then do;
        make = 'Mazda';
        seat = 2;
   end;
datalines;
Corvette 1955 .      2
Mustang  1966 Ford   4
Miata    2002 .      .
Camaro   1990 .      4
Pinto      .  Ford   3
;
run;
                                        ******SAS looks at the missing year for the Pinto.
                                                        SAS will say the Missing is less than 1975.
                                                        SAS sees a missing numeric value as smaller than everything;


proc print;
title 'My collection of used sports cars';
quit;




data sportscar;
  input model $ year make $ seat;
  if (year < 1975) and (year ne . ) then status='classic';
  if model='Corvette' or model='Camaro' then make='Chevy';
  if model='Miata' then do;
        make = 'Mazda';
        seat = 2;
   end;
datalines;
Corvette 1955 .      2
Mustang  1966 Ford   4
Miata    2002 .      .
Camaro   1990 .      4
Pinto      .  Ford   3
;
run;
                                        ******SAS looks at the missing year for the Pinto.
                                                        SAS will say the Missing is less than 1975.
                                                        SAS sees a missing numeric value as smaller than everything;


proc print;
title 'My collection of used sports cars';
quit;


/*
IF condition THEN action;
    ELSE IF condition THEN action;
    ELSE action;
*/
data grade;
  input subject  gender $  exam1  exam2 hwgrade $;
  final=sum(exam1, exam2)/2;
  if 0 <=final < 65 then grade = 'F';
    else if  65 <=final < 75 then grade = 'C';
    else if  75 <=final < 85 then grade = 'B';
    else grade = 'A';
datalines;
10 M 80 84 A
 7 M 85 89 A
 4 F 90 86 B
;
run;
proc print data=grade;
quit;

data grade;
  input subject  gender $  exam1  exam2 hwgrade $;
  final=sum(exam1, exam2)/2;  ****SUM function adds all the variables and ignores missing*****;
  final2 = (exam1 +exam2)/2;    ***ANY MISSING VALUE WILL RESULT IN A MISSING SCORE FOR THE VARIABLE****;
  if 0 <=final < 65 then grade = 'F';
    else if  65 <=final < 75 then grade = 'C';
    else if  75 <=final < 85 then grade = 'B';
    else grade = 'A';
datalines;
10 M 80 84 A
 7 M 85 89 A
 4 F 90 86 B
 6 F 40 74 D
 5 M  85 . A
 1 F  . .  D
2  M 94 25 .
;
run;
proc print data=grade;
quit;

data grade;
  input subject  gender $  exam1  exam2 hwgrade $;
  final=sum(exam1, exam2)/2;  ****SUM function adds all the variables and ignores missing*****;
  final2 = (exam1 +exam2)/2;    ***ANY MISSING VALUE WILL RESULT IN A MISSING SCORE FOR THE VARIABLE****;
  if  final < 65 then grade = 'F';
    else if  65 <=final < 75 then grade = 'C';
    else if  75 <=final < 85 then grade = 'B';
    else grade = 'A';
datalines;
10 M 80 84 A
 7 M 85 89 A
 4 F 90 86 B
 6 F 40 74 D
 5 M  85 . A
 1 F  . .  D
2  M 94 25 .
;
run;
proc print data=grade;
quit;

proc print data=grade (obs=2);
quit;




proc print data=grade;
where subject = 4 or subject = 1;  ****SAS doesn^t like _n_ in a where statement***;
quit;


/**
Using OBS in condition

AND / &:  All parts must be true for condition to be true
Or / |: At least one part must be true for condition to be true

IF condition THEN DELETE;

IF condition;


***/

IF _n_ <= 10 THEN INC=0;



****************************************PART 1 STOP**************;



**********************PART 2: BEGIN**********************;



 /****SOME DATABASES HAVE INTERNAL FORMATS.  IF YOU DON'T KNOW THEM.
SAS WILL STILL LOAD DATA AS LONG AS THE OPTIONS LINE HAS NOFMTERR****/




data salary;
infile cards missover;
  input S X E M;
cards;
13876 1 1 1
11608 1 3 0
18701 1 3 1
11283 1 2 0
11767 1 3 0
20872 2 2 1
11772 2 2 0
10535 2 1 0
12195 2 3 0
12313 3 2 0
14975 3 1 1
21371 3 2 1
19800 3 3 .
11417 4 1 0
20263 4 3 1
13231 4 3 0
12884 4 . 0
13245 5 2 0
13677 5 3 0
15965 5 1 1
12336 . 1 0
21352 6 3 1
13839 6 2 0
22884 6 2 1
16978 7 1 1
14803 8 2 0
. 8 1 1
. 8 3 1
13548 8 1 0
14467 10 1 0
15942 10 2 0
23174 10 3 1.002
23780 10 2 1.5
25410 11 2 1
14861 11 1 0.67
16882 12 2 0
24170 12 3 1
15990 13 1 0
26330 13 2 1
17949 14 2 0
25685 15 3 1
27837 16 2 1.8
18838 16 2 0
17483 16 1 0
19207 17 2 0
19346 20 1 0
;
run;

proc print data=salary;
quit;



data salary;
set salary;

IF _n_ >31 THEN G=1;     ****_n_ as pointing to the observation number****;
IF _n_ <= 31 THEN G=0;
run;


data females;      *New SAS data set;
 set salary;     *Created from salary;

IF G=1;

run;

data males;    *New SAS data set;
 set salary;     *Created from salary;

IF G=0;

run;


proc print data=salary (obs=41);
quit;

proc print data=salary ;
where _n_ = 41;  *****We can't use the _n_ as a vARIABLE BUT ONLY AS A CONDITION *****;
quit;


data salary;
set salary;
IF _n_ = 41 then Flag = 1;  ***Using _n_ as the condition to create the variable FLAG so we can pull it out***;
run;

proc print data=salary ;
where Flag = 1;  *****We used the condition statement above to create a FLAG variable for the 41st obsrrv *****;
quit;



*********************PART 2 END******************;


***************************************PART 3: ARITHMETIC****************;




data htwt;                             * create data set named HTWT      ;
input name $ sex $ age height weight;  * input variables by name and type;
x = height + weight;                   * create x                        ;
y = age**2;     * create y - ** exponentiation    ;
y_3 = age**3;  * age cubed**;
z = 3*age - 5;
zz=hight + weight;   ****hight does not exist so SAS sets zz to missing for all****;
cards;
alfred     M 14 69 112
alice      F 13 56  84
barbara    F 14 62 102
henry      M 15 67 135
john       M 16 70 165
sally      F 16 63 120
;
run;

proc print data=htwt;
quit;



proc print;                       * print the data;
title 'Height-Weight Example #1'; * put title with data;
quit;
title;



data htwt2;                             * create data set named HTWT      ;
input name $ sex $ age height weight;  * input variables by name and type;
cards;
alfred     M 14 69 112
alice      F 13 56  84
barbara    F 14 62 102
henry      M 15 67 135
john       M 16 70 165
sally      F 16 63 120
;
x = height + weight;                   * create x                        ;
y = age**2;     * create y - ** exponentiation    ;
y_3 = age**3;  * age cubed**;
z = 3*age - 5;
run;

proc print data=htwt2;    ***SAS WANTS THE COMPUTATION BEFORE THE DATA BLOCK***;

quit;


*****Data Entry - Space Separated****;
data grade;
    input subject  gender $  exam1 exam2 hwgrade $;
    datalines;
10 M 80 84 A
7 M 85 89 A
4 F 90 86 B
20 M 82 85 B
25 F 94 94 A
14 F 88  . C
;
run;

proc print;  ***Without the data= sas will print out the last created/modified data***;
quit;



***Data Entry - Comma Sepated****;
data grade;
    infile datalines dlm=',';   ****Telling SAS that the data in the datalines
                                                                        block has each variable data value separated
                                                                        by a comma****;
    input name $ exam1 exam2 hwgrade $;
    datalines;
Grossman,80,84,A
Matthew,85,89,A
Lori,90,86,B
Brian,82,85,B
;
run;

proc print;
quit;



*****Data Entry - Visual Observation of Columns****;

data xgrade;
    input name $   exam1   exam2  hwgrade $ ;
    datalines;
Alicia Grossman8084A
Matthew Lee    8589A
Lori Newcombe  9086B
Brian Williams 8285B
Frank Chen     9494A
Jose Martinez  88  C
;
run;
proc print data=xgrade;
quit;



data grade;
    input name $1-15   exam1 16-17  exam2 18-19  hwgrade $20;
    datalines;
Alicia Grossman8084A
Matthew Lee    8589A
Lori Newcombe  9086B
Brian Williams 8285B
Frank Chen     9494A
Jose Martinez  88  C
;
run;

proc print data=grade;
quit;



****Data Entry Using Pointers*****;

   data demograph;
    input name $1-15 @17 gender $1. @19 birthdate MMDDYY10.
             +1 hight 3.1  +1 salary comma10.;
    datalines;
John Lee        M 10-01-1968 6.5 $36,000
Alicia Grossman F 01-01-1960 5.4 $148,000
;
run;

proc print;
Title "Data input using informats and cursor controls";
quit;
title;

   data demograph2;
    input name $1-13 @17 gender $1. @19 birthdate MMDDYY10.
             +1 hight 4.2  +1 salary comma10.;
    datalines;
John Lee        M 10-01-1968 6.55 36,000
Alicia Grossman F 01-01-1959 5.45 148,000
;
run;

proc print;
Title "Data input using informats and cursor controls";
quit;
title;


****Data Entry - Holding the Lin SAS*****;
data grade;
    input subject gender $1. @ ;             /*single @  hold the line*/
    if  gender = 'F'  then delete;
    input exam1 exam2 hwgrade $ 1.;
   datalines;
10 M 80 84 A
 7 M 85 89 A
 4 F 90 86 B
20 M 82 85 B
25 F 94 94 A
14 F 88  . C
;
run;

proc print data=grade;
quit;


******Data Entry - Multiple Lines of Data Per row****;
data grade;
    input subject  gender $  exam1 exam2 hwgrade $ @@;
   datalines;
10 M 80 84 A 7 M 85 89 A 4 F 90 86 B
20 M 82 85 B 25 F 94 94 A 14 F 88  . C
;
run;


proc print;
quit;


  *****Data Entry - Reading from a Text File****;

filename grade "\\Client\C:\Users\SMSTAT\Documents\WCULaptop\STA311\ONLINE\Topic7\grades.txt";
data grade;
    infile  grade dlm=',' dsd;
    input subject  gender $  exam1 exam2 hwgrade $;
run;



proc print;
quit;



filename grade2 "\\Client\C:\Users\SMSTAT\Documents\WCULaptop\STA311\ONLINE\Topic7\gradea.txt";

data grade;
    infile grade2 dlm=',' dsd missover;
    input subject  gender $  exam1 exam2 hwgrade $;
run;

proc print;
quit;


filename grade3 "\\Client\C:\Users\SMSTAT\Documents\WCULaptop\STA311\ONLINE\Topic7\grade.txt";


   data grade;
    infile grade3 dlm="," dsd missover firstobs=2 obs=7;
    input subject  gender $  exam1 exam2 hwgrade $;
run;



proc print;
quit;






    data address;
    infile '\\Client\C:\Users\SMSTAT\Documents\WCULaptop\STA311\ONLINE\Topic7\address.txt' truncover;
    input name $ 1-15 number 16-19 street $ 22-37;
run;

proc print;
quit;




data baseline;
  length center $20;
  input subjno @8 center & @23 ldl totchol hdl;
  label subjno ='Subject #'
        ldl    ='LDL Cholesterol'
        totchol='Total Cholesterol'
        hdl    ='HDL Cholesterol' ;
datalines;
110013 Boston         8.23 109.5 181.0
110019 Salt Lake      9.27 117.0 191.0
110067 San Francisco  5.75 117.5 185.5
;
run;

proc means;
var ldl totchol hdl;
title "Means report for baseline measurements";
quit;
    title;




options ls=90 ps=50 nofmterr;


*************************END OF PART 3*******************;
