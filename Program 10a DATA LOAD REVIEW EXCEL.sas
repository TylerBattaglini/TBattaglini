libname load 'C:\Users\SMSTAT\Documents\WCULaptop\STA511\Fall2018\Week8\DATALOAD';
libname load '\\Client\C:\Users\SMSTAT\Documents\WCULaptop\STA311\ONLINE\Topic8\DATALOAD';



data load1;
set load.aae;
run;

proc contents data=load1;
quit;



PROC IMPORT OUT= LOAD.exload1
            DATAFILE= "C:\Users\SMSTAT\Documents\WCULaptop\STA511\Fall
2018\Week8\EXCELLOAD\AAExls.XLS"
            DBMS=EXCEL REPLACE;
     RANGE="TDS_DATA";
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;



PROC IMPORT OUT= LOAD.exload1
            DATAFILE= "\\Client\C:\Users\SMSTAT\Documents\WCULaptop\STA311\ONLINE\Topic8\EXCELLOAD\AAExls.XLS"
            DBMS=XLS REPLACE;
RUN;

proc contents data=load.exload1;
quit;



PROC IMPORT OUT= exload1
            DATAFILE= "\\Client\C:\Users\SMSTAT\Documents\WCULaptop\STA511\Fall
2018\Week8\EXCELLOAD\AAExls.XLS"
            DBMS=EXCEL REPLACE;
     RANGE="TDS_DATA";
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;


data load.PERMAAE;
set exload1;
run;
