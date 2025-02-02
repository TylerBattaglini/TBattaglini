data salary;
informat rk $12. dg $12.;
infile '\\Client\C:\Users\rgallop\Documents\SMSTATCOMPUTER\WCULaptop\STA311\ONLINE\Topic7\salary.dat';
input sex $ rk $ yr  dg $ yd  salary;
run;




data salary;
set salary;  ****UpDATING THE EXISTING WORK FILE SALARY****;

VISIT_FAC = 0;
if _n_ le 10 then VISIT_FAC = 1;
run;



proc print data=salary;
quit;



proc freq data=salary;
tables sex;
quit;




data males;
set salary;
if sex ='male' ;
*if SEX='male'; *****Variable names are not case sensitivie****;
*if SEX='Male';  *****Character variables values are CASE sensitive****;
run;




data females;
set salary;
*if sex ne 'male' ;
*if sex ='female' ;
 *if sex in: ('fe') ;  ****IF THE VARIABLE SEX STARTS WITH fe  we keep those observations****;



 *if sex in: ('FE') ;  ****IF THE VARIABLE SEX STARTS WITH FE  we keep those observations****;
 if UPCASE(sex) in: ('FE') ;  ****IF THE VARIABLE SEX IN UPPERCASE STARTS WITH FE  we keep those observations****;

run;

PROC PRINT DATA=FEMALES;
QUIT;





proc freq data=salary;
tables rk;
quit;


proc sort data=salary;
by rk salary;
quit;

proc print data=salary;
quit;


proc print data=salary;
by rk;
quit;



proc sort data=salary;
by rk descending salary;
quit;

proc print data=salary;
quit;


proc print data=salary;
by rk;
quit;



proc freq data=salary;
tables rk;
quit;


data assist;
set salary;
if rk = 'assistant';
run;


data assoc;
set salary;
if rk = 'associate';
run;




data full;
set salary;
if rk = 'associate' or rk = 'assistant' then delete;
run;




proc print data=full;
quit;

proc print data=salary;
where rk = 'full';
quit;
