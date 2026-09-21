//FINALJOB JOB (ACCT),'FINAL COBOL BATCH',
//             CLASS=A,
//             MSGCLASS=X,
//             NOTIFY=&SYSUID
//*
//* FINAL COBOL BATCH PROJECT
//*
//* Conceptual JCL representation for the local portfolio project.
//* This file is not executed on macOS.
//*
//STEP01   EXEC PGM=FINAL-PROJECT
//*
//STEPLIB  DD  DSN=COBOL.LOADLIB,DISP=SHR
//*
//SYSIN    DD  *
PROCESS TRANSACTIONS
/*
//SYSPRINT DD  SYSOUT=*
//SYSOUT   DD  SYSOUT=*
//*
//INPUT    DD  DSN=COBOL.INPUT.TRANSACTIONS,DISP=SHR
//OUTPUT   DD  DSN=COBOL.OUTPUT.FINALREPORT,
//             DISP=(NEW,CATLG,DELETE),
//             SPACE=(TRK,(1,1)),
//             DCB=(RECFM=FB,LRECL=100,BLKSIZE=0)
