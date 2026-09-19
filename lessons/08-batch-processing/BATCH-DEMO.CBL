       IDENTIFICATION DIVISION.
       PROGRAM-ID. BATCH-DEMO.
    
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
    
           SELECT TRANSACTION-FILE ASSIGN TO
            "lessons/08-batch-processing/data/input/transactions.dat"
            ORGANIZATION IS LINE SEQUENTIAL
            FILE STATUS IS WS-FILE-STATUS.
    
           SELECT BATCH-REPORT-FILE ASSIGN TO
            "lessons/08-batch-processing/data/output/batch-report.txt"
            ORGANIZATION IS LINE SEQUENTIAL
            FILE STATUS IS WS-REPORT-STATUS.
    
       DATA DIVISION.
       FILE SECTION.
    
       FD  TRANSACTION-FILE.
    
       COPY "copybooks/TRANSACTION-RECORD.CPY".
    
       FD  BATCH-REPORT-FILE.
    
       01  BATCH-REPORT-RECORD PIC X(80).
    
       WORKING-STORAGE SECTION.
    
       01  WS-FILE-STATUS           PIC XX      VALUE "00".
       01  WS-REPORT-STATUS         PIC XX      VALUE "00".
       01  WS-EOF                   PIC X       VALUE "N".
       01  WS-TRANSACTION-COUNT     PIC 9(3)    VALUE 0.
       01  WS-APPROVED-COUNT        PIC 9(3)    VALUE 0.
       01  WS-REJECTED-COUNT        PIC 9(3)    VALUE 0.
       01  WS-TOTAL-AMOUNT          PIC 9(8)V99 VALUE 0.
       01  WS-TOTAL-AMOUNT-DISPLAY  PIC Z(7)9.99.
    
       PROCEDURE DIVISION.
    
       MAIN-PROCESS.
    
           DISPLAY "========================================"
           DISPLAY "       BATCH PROCESSING DEMO"
           DISPLAY "========================================"
    
           DISPLAY "BATCH STATUS: STARTED"
    
           OPEN INPUT TRANSACTION-FILE
    
           IF WS-FILE-STATUS NOT = "00"
               DISPLAY "BATCH ERROR: CANNOT OPEN INPUT FILE"
               MOVE 1 TO RETURN-CODE
               STOP RUN
           END-IF
    
           OPEN OUTPUT BATCH-REPORT-FILE
    
           IF WS-REPORT-STATUS NOT = "00"
               DISPLAY "BATCH ERROR: CANNOT OPEN REPORT FILE"
               CLOSE TRANSACTION-FILE
               MOVE 1 TO RETURN-CODE
               STOP RUN
           END-IF
    
           PERFORM UNTIL WS-EOF = "Y"
    
               READ TRANSACTION-FILE
                   AT END
                       MOVE "Y" TO WS-EOF
                   NOT AT END
                       PERFORM PROCESS-TRANSACTION
               END-READ
    
           END-PERFORM
    
           PERFORM WRITE-BATCH-REPORT
    
           CLOSE TRANSACTION-FILE
           CLOSE BATCH-REPORT-FILE
    
           DISPLAY "BATCH STATUS: COMPLETED"
           DISPLAY "TRANSACTIONS PROCESSED: "
               WS-TRANSACTION-COUNT
    
           MOVE 0 TO RETURN-CODE
    
           STOP RUN.
    
       PROCESS-TRANSACTION.
    
           ADD 1 TO WS-TRANSACTION-COUNT
    
           IF TRX-STATUS = "APPROVED"
               ADD 1 TO WS-APPROVED-COUNT
           ELSE
               ADD 1 TO WS-REJECTED-COUNT
           END-IF
    
           ADD TRX-AMOUNT TO WS-TOTAL-AMOUNT.
    
       WRITE-BATCH-REPORT.
    
           MOVE WS-TOTAL-AMOUNT TO WS-TOTAL-AMOUNT-DISPLAY
    
           MOVE SPACES TO BATCH-REPORT-RECORD
           STRING
               "TRANSACTIONS: "
               WS-TRANSACTION-COUNT
               DELIMITED BY SIZE
               INTO BATCH-REPORT-RECORD
           END-STRING
           WRITE BATCH-REPORT-RECORD
    
           MOVE SPACES TO BATCH-REPORT-RECORD
           STRING
               "APPROVED: "
               WS-APPROVED-COUNT
               DELIMITED BY SIZE
               INTO BATCH-REPORT-RECORD
           END-STRING
           WRITE BATCH-REPORT-RECORD
    
           MOVE SPACES TO BATCH-REPORT-RECORD
           STRING
               "REJECTED: "
               WS-REJECTED-COUNT
               DELIMITED BY SIZE
               INTO BATCH-REPORT-RECORD
           END-STRING
           WRITE BATCH-REPORT-RECORD
    
           MOVE SPACES TO BATCH-REPORT-RECORD
           STRING
               "TOTAL AMOUNT: "
               FUNCTION TRIM(WS-TOTAL-AMOUNT-DISPLAY)
               DELIMITED BY SIZE
               INTO BATCH-REPORT-RECORD
           END-STRING
           WRITE BATCH-REPORT-RECORD.
    
    