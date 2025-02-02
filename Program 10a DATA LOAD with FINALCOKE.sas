

/*
Run PROC CONTENTS on the data COKE
Create separate data sets for each month.
Create separate data sets for each site
Create separate data sets for each gender.
Create separate data sets as follows: Baseline (consisting of month 0), EARLY (consisting of month 1,2,3), and LATE (consisting of month 4, 5, 6)


*/

libname coke '\\Client\C:\Users\SMSTAT\Documents\WCULaptop\STA311\ONLINE\Topic8';


data coke;
set coke.finalcoke;
run;

proc contents data=coke position short; quit;



proc contents data=coke position ; quit;

/*
PATNO MONTH TX_COND SITE MED_SUB EMP_SUB ALC_SUB DRU_SUB LEG_SUB FAM_SUB PSY_SUB DAYSUSED BDI
GSI BAI SIGHD17 SUIPU SUIPR ARS BEH_ARS BEL_ARS BASA HAM27 IIP DOMI VIND COLD SOAV NOAS EXPL OVNU I
NTR M0ASIDR M0ASIPS PS_HAM17 M0ALU30 M0COC30 M0ASIAL M0ASILE M0ASIEM M0ASIFA M0ASIMD PSBDI PSGSI PS_IIP P
S_DOMI PS_VIND PS_COLD PS_SOAV PS_NOAS PS_EXPL PS_OVNU PS_INTR ps_ars ps_BEH_ARS ps_BEL_ARS ps_basa PS_HAM27
ps_SUIPU
ps_SUIPR PVDAYS CENSOR DEDAYS DCENSOR ZM0 GENDER AGE M0CPI RACE MAR_STAT JOB CRACK EDUCATE COMPLETE SITES GTHS

*/

proc freq data=coke;
tables month;
quit;


data m0; set coke; if month = 0; run;
data m1; set coke; if month = 1; run;
data m2; set coke; if month = 2; run;
data m3; set coke; if month = 3; run;
data m4; set coke; if month = 4; run;
data m5; set coke; if month = 5; run;
data m6; set coke; if month = 6; run;



proc freq data=coke;
tables site;
quit;

data MGH; set coke; if site='MGH'; run;
data McLean; set coke; if site='McLean'; run;
data Penn; set coke; if site='Penn'; run;
data WPIC; set coke; if site='WPIC'; run;
data brookside; set coke; if upcase(site) in: ('B'); run;



proc freq data=coke;
tables gender;
quit;


data male ;
set coke;
if gender = 0 ;
run;

data female ;
set coke;
if gender = 1 ;
run;

data baseline;
set coke;
if month = 0;
run;


data early;
set coke;
if month in (1,2,3);
*if month = 1 or month=2 or month = 3;
*if month =1 or 2 or 3;  *****THIS LINE DOES NOT WORK****;
run;


data late;
set coke;
if month gt 3;
run;
