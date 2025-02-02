OPTIONS NOFMTERR;
libname EXAM 'I:\STA 311';
data CalTemp;
set Exam.Rawdata_a;
round_x= round(x);
whole_x= int(x);
big= max (x y z)
sum= sum (x y z)
flag
state
zipcode
run;


proc print data=Exam.Table1_jccp2006;
var ID TXCONDA GENDER AGE BIRTHDAY;
format BIRTHDAY date9.;
quit;
proc print data=Exam.Baselin(obs=18);
quit;

data MARRIEDONLY;
set Exam.Ex3_demogr;
if marstat=1 then 'married';
data Racenum;
set Exam.Ex3_demogr;
format Race = numeric;
data Ex3;
set Ex3_demogr;
stopmeds= taf1;

data Voters;
set Starp_data;
if AGE=18 then 



