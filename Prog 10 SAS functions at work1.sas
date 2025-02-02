
/*  SAS functions:  time and date  */


data age;
 input name $ dob MMDDYY8.;
 birthday=dob;
 age1= ((today()-dob)/365.25); ****today() function sas sees as todays date****;
 age= int((today()-dob)/365.25); ****today() function sas sees as todays date****;
 age2= int((MDY(8, 6, 18)-dob)/365.25);  ****MDY COMMAND ALLOWS US TO MANUALLY ENTER A SAS DATE*;

 age4= ROUND(((today()-dob)/365.25),1); ****today() function sas sees as todays date****;
datalines;
Cody 10/21/50
Smith 01/23/66
Ymith 08/23/66
RUN;

options date;
proc print data=age;
format dob worddate.;
quit;

proc print data=age;
format birthday worddate.;
quit;
/*  SAS functions:  INTCK vs INTNX
INTCK (interval, start, end)
    - returns the number of intervals between any two dates
  INTNX (interval, start, n)
    - returns a date given an interval, starting date and the number of intervals (n) elapsed

*/

data age;
set age;
Yrs = INTCK ('Years', dob, today());  *** We saw this adds a Year to Cody***;
run;

proc print data=age;
format dob mmddyy8.;
quit;




data intf;
 num_qtr = INTCK ('QTR', '15JUL02'd, '31DEC03'd);  ****hOW MANY QUARTERS BETWEEN TWO DATES***;

 num_DAYS = INTCK ('DAYS', '15JUL02'd, '31DEC03'd);****hOW MANY daYS BETWEEN TWO DATES***;
 num_MO = INTCK ('mONTHS', '15JUL02'd, '31DEC03'd);****hOW MANY MOTNHS BETWEEN TWO DATES***;
 num_WK = INTCK ('WEEKS', '15JUL02'd, '31DEC03'd);****hOW MANY WEEKS BETWEEN TWO DATES***;
 date3rd = INTNX ('WEEKS', '28JUN06'd, 1);
 format date3rd MMDDYY8.;
proc print;
title "15JUL02d 31DEC03 01Jan03d 3";
run;
title;





/*
SAS uses the standard arithmetic operators
+, -, *, /, ** (exponentiation)
Note on Missing Values: Arithmetic operators propagate missing values.

*/



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



data salary;
set salary;

SX = S+X;
Xstarm = x*M;
Eexp5 = E**5;
run;

proc print data=salary;

quit;



 /*


round(variable,value): Rounds variable to nearest unit given by value.
sum(variable1, variable2, …): Adds any number of variables and ignores missing values

 */

data salary;
set salary;

M_tens = round(M, 0.1);
M_int = round(M,1);

SsumX = sum(S,X);  **** TOTALS the values and basically treats missings as 0
                                                Gives a missing response when all items are missing***;
SsumX2 = S+X;   ****totals the values, if any are missinng gives a missing total**;
                                        *****When no missing, these two give the same value***;

run;




proc print data=salary;

quit;



/*

base =10;                  numeric constant
Base ='ten';            character constant
quantity = base;        a variable
quantity = base + 100;       addition
quantity = base - 100;       subtraction
quantity = base * 100;       multiplication
quantity = base / 100;       division
quantity = base ** 2;       exponentiation

SAS follows Standard mathematical rules of precedence

        x = 10 * 4 + 2**2;        Result: x = 44
      x = 10 * (4 + 2**2);                x = 80
      x = 10 * (4 + 2)**2;                x = 360



*/




data contest;
  input name $ 1-15 age 3. +1 type $1. +1
        date MMDDYY10. (scr1 scr2 scr3 scr4 scr5)(4.1);
  avgScr = MEAN(scr1, scr2, scr3, scr4, scr5);
  DayEntered = DAY(date);
  type= UPCASE(type);
datalines;
Alicia Grossman 13 c 10-28-1999 7.8 6.5 7.2 8.0 7.9
John Lee         9 D 10-30-1999 7.0 7.5 7.2 7.0 7.9
Bob Chen         7 d 10-29-1999 7.0 7.5   . 7.0 7.9
;
run;

proc print data=contest;
title "Pumpkin Carving Contest";
quit; title;




data contest;
  input name $ 1-15 age 3. +1 type $1. +1
        date MMDDYY10. (scr1 scr2 scr3 scr4 scr5)(4.1);
  avgScr = MEAN(scr1, scr2, scr3, scr4, scr5);
  avgScr2 = (SCR1+SCR2+SCR3+SCR4+SCR5)/5;
  DayEntered = DAY(date);
  type= UPCASE(type);
datalines;
Alicia Grossman 13 c 10-28-1999 7.8 6.5 7.2 8.0 7.9
John Lee         9 D 10-30-1999 7.0 7.5 7.2 7.0 7.9
Bob Chen         7 d 10-29-1999 7.0 7.5   . 7.0 7.9
Bob ChenV         7 d 10-29-1999 . .   . . 7.9
Bob ChenVv         7 d 10-29-1999 . .   . . .
;
run;

proc print data=contest;
title "Pumpkin Carving Contest";
format date mmddyy8.;
quit; title;


/*
see slide of SAS Functions for the common functions in SAS


  N   returns the number of nonmissing values
NMISS  returns the number of missing values

*/


data nnmiss;
 input (X1-X10)(4.1);  ** X1-X10 SAS SEES AS SHORTHAND FOR X1 X2 X3 X4 ... X10***;
 *if N(of X1-X10) >= 6 then avg=mean(of X1-X10);
                **N is a sas function counting the number of nonmissing variables***;
  ****(OF X1-X10 IS SAS SHORTHAND FOR X1,X2,X3,...,X10****;

 if NMISS(of X1-X10) < 4 then avg=mean(of X1-X10);
datalines;
1.1 4.2 8.5 2.5 4.5 5.3 7.4   . 9.8 7.1
1.4   . 8.5   . 4.5   . 7.6   . 9.8   .
2.0 4.5 6.5 2.5 4.5 6.0 8.0 8.8 9.3 9.2
;
run;


proc print data=nnmiss;
title 'example using nnmiss sas functions';
quit;
title;

/*
  RANUNI ( )  generate random numbers with U(0, 1)
*/

data random;
 input name $ @@;  ****REMEMBER THE @@ ALLOWS FOR MULTIPLE OBSERVATIONS GTO BE
                                        ENERED ON A SINGLE DATA LINE.  WHEN THE VARIABLE IS FULL SAS CREATES A
                                        NEW ONBSERVATION AS IT READS LEFT TO RIGHT.;

 x = ranuni (9);  ***(9) IS CALLED A SEED FOR THE RANDOM NUMBER GENERATOR
                                        IF THAT VALIE IS (0) ANYTIME YOU RUN THE CODE, YOU'LL GET
                                        differfent vaalues. IF YOU WANT THE SAME RANDOM VALUES PRODUCED EACH TIME YOU
                                        RUN THE CODE, PUT A SEED IN THERE.   JUST LIKE WE HAVE (9) THERE;

 y=1 + 99 * x;
datalines;
Cody  Smith  Martin
;
run;

proc print data=random;
title 'Name list';
quit;
title;



data random;
 input name $ @@;  ****REMEMBER THE @@ ALLOWS FOR MULTIPLE OBSERVATIONS GTO BE
                                        ENERED ON A SINGLE DATA LINE.  WHEN THE VARIABLE IS FULL SAS CREATES A
                                        NEW ONBSERVATION AS IT READS LEFT TO RIGHT.;

 x = ranuni (0);  ***(9) IS CALLED A SEED FOR THE RANDOM NUMBER GENERATOR
                                        IF THAT VALIE IS (0) ANYTIME YOU RUN THE CODE, YOU'LL GET
                                        differfent vaalues. IF YOU WANT THE SAME RANDOM VALUES PRODUCED EACH TIME YOU
                                        RUN THE CODE, PUT A SEED IN THERE.   JUST LIKE WE HAVE (9) THERE;

 y=1 + 99 * x;
datalines;
Cody  Smith  Martin
;
run;

proc print data=random;
title 'Name list';
quit;
title;





proc sort data=random;
by x;
quit;

proc print data=random;
title 'Name in random order';
quit;
title;




/*
  Select Statement
*/

data grade;
  input subject  gender $  exam1  exam2;
datalines;
10 M 80 84
 4 F 90 86
;
run;


proc print data=grade;
quit;


data final;
 set grade;
final=sum(exam1, exam2)/2;
final2=(exam1 + exam2)/2;
 select;
      when (0  <= final < 65) grade = 'F';
      when (65 <= final < 75) grade = 'C';
      when (75 <= final < 85) grade = 'B';
      when      (final >= 85) grade = 'A';
 end;
run;

proc print data=final;
quit;




/*  PROC FORMAT  */


  proc format;
 value scorefmt
0  -< 65 ='F'
65 -< 75 ='C'
75 -< 85 ='B'
85 -high ='A'
;
quit;


data final;
 set grade;
final3=sum(exam1, exam2)/2;
run;


proc print data=final;
format final3 scorefmt.;
quit;



data grade2;
  input subject  gender $  exam1  exam2;
datalines;
10 M 80 84
 4 F 90 86
 17 M 98 100
 18 M 100 100
;
run;


data final2;
 set grade2;
final=sum(exam1, exam2)/2;
run;

proc print data=final2;
format final scorefmt.;
quit;


  proc format;
 value scorehmt
0  -< 65 ='F'
65 -< 75 ='C'
75 -< 85 ='B'
85 - < 99 ='A'
100-high='A+';
;
quit;


proc print data=final2;
format final scorehmt.;
quit;

  proc format;
 value scoreymt
0  -< 65 ='F'
65 -< 75 ='C'
75 -< 85 ='B'
85 -  99 ='A'
100-high='A+';
;
quit;


proc print data=final2;
format final scoreymt.;
quit;



proc print data=final2;
where final ge 85;
format final scoreymt.;
quit;


/*
char_var = PUT(num, fmt.):  Convert NUM var into CHAR var;

*/


  data grade;
  input ssn $11.  gender $  exam1  exam2;
datalines;
123-45-6789 M 80 84
345-67-1234 F 85 89
;
run;

proc format;
 value scorefmt
0-<65 ='F' 65-< 75 ='C' 75-< 85 ='B' 85-high ='A';
quit;

data final;
 set grade;
score=sum(exam1, exam2)/2;
final=put(score, scorefmt.);
run;

proc print data=final; quit;

proc contents data=final;quit;

/*
  INPUT(char, w.):  Convert CHAR var into NUM var;
*/


data grade;
  input ssn $11.  gender $  exam1  exam2;
datalines;
123-45-6789 M 80 84
345-67-1234 F 85 89
;
run;

data grade;
 set grade;
id=input(compress(ssn, '-'), 9.);
run;

proc print;
quit;;

/*

  RETAIN statement“remembering” values from the previous observation

*/

data incorrect;
 subject=subject+1;
 input exam1 exam2;
datalines;
65 80
90 75
88 91
;
run;

proc print data=incorrect;
Title "Subject was created in a wrong way";
quit;
title;





 data correct;
 retain subject 0;
 subject=subject+1;
 input exam1 exam2;
datalines;
65 80
90 75
88 91
;
run;

proc print data=correct;
Title "Subject was created in a correct way";
quit;
title;


 data correct;
 retain subject 100;   ****Initializes the Null-row of data at 100  *****;
 subject=subject+10;
 input exam1 exam2;
datalines;
65 80
90 75
88 91
;
run;

proc print data=correct;
Title "Subject was created in a correct way";
quit;
title;



 data incorrect2;
 subject =200;   *****We set 200 as the value for ALL Observations/All ROWS*****;
 subject=subject+10;
 input exam1 exam2;
datalines;
65 80
90 75
88 91
;
run;

proc print data=incorrect2;
Title "Subject was not created in a correct way";
quit;
title;




/*
  DATA Step Revisit to Understand RETAIN statement
*/


data example;
*When the data statement is executed, SAS allocates a portion of memory space and names the data set “example”.
 Before the INPUT statement is executed, all the variables are assigned missing values;
input exam1 exam2;
*The INPUT reads the first line of data and substitutes the actual values for the missing values.
These data values are not yet written to the SAS data set, but to a “holding area” called PDV (program data vector);
datalines;
65 80
90 75
;

*triggers the end of one loop of DATA step and the values in PDV are transferred to the SAS dataset.;
*One observation was written for the sas data set. The program then returns control back to the INPUT to read the next line of data.;
;
*tell the SAS software that the end of the above reading and writing cycle and the data set creation completed.;
run;








/*   Missing Values*****/

data grades;
  input name $ 1-5 quiz 7-8 exam 10-11 project $ 13-14 absences 16;
datalines;
Ann   84 90 A- 0
Bill  78 84 B  0
Cathy 95 89 A  1
David 84 88 B+ 1
Eve   79       4
;
run;

proc print data=grades;
quit;
