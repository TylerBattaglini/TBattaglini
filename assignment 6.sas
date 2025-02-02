libname mysetsll 'I:\STA 311';
data mysets11;
set mysetsll.Crq_best;
run;

proc contents data=mysetsll.Crq_fath;
quit;

proc print 
