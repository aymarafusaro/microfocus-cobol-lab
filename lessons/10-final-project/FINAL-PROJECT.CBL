       IDENTIFICATION DIVISION.
       PROGRAM-ID. FINAL-PROJECT.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT TRANSACTION-FILE
               ASSIGN TO "lessons/10-final-project/data/input/transactions.dat"
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS IS WS-INPUT-STATUS.

           SELECT REPORT-FILE
               ASSIGN TO "lessons/10-final-project/data/output/final-report.txt"
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS IS WS-OUTPUT-STATUS.

       DATA DIVISION.
       FILE SECTION.

       FD  TRANSACTION-FILE.
       01  TRANSACTION-LINE       PIC X(40).

       FD  REPORT-FILE.
       01  REPORT-LINE            PIC X(100).

       WORKING-STORAGE SECTION.

       COPY "copybooks/TRANSACTION-RECORD.CPY".

       01  WS-INPUT-STATUS        PIC XX.
       01  WS-OUTPUT-STATUS       PIC XX.

       01  WS-EOF                 PIC X VALUE "N".
           88  END-OF-FILE        VALUE "Y".

       01  WS-TRANSACTIONS        PIC 9(4) VALUE 0.
       01  WS-APPROVED            PIC 9(4) VALUE 0.
       01  WS-REJECTED            PIC 9(4) VALUE 0.

       01  WS-TOTAL-AMOUNT        PIC 9(10)V99 VALUE 0.
       01  WS-APPROVED-AMOUNT     PIC 9(10)V99 VALUE 0.
       01  WS-REJECTED-AMOUNT     PIC 9(10)V99 VALUE 0.

       01  WS-TOTAL-DISPLAY       PIC ZZZZZZZZZ9.99.
       01  WS-APPROVED-DISPLAY    PIC ZZZZZZZZZ9.99.
       01  WS-REJECTED-DISPLAY    PIC ZZZZZZZZZ9.99.

       PROCEDURE DIVISION.

       MAIN-PROCESS.

           DISPLAY "========================================"
           DISPLAY "       FINAL COBOL BATCH PROJECT"
           DISPLAY "========================================"

           PERFORM OPEN-FILES

           IF RETURN-CODE NOT = 0
               STOP RUN
           END-IF

           PERFORM PROCESS-TRANSACTIONS
               UNTIL END-OF-FILE

           PERFORM WRITE-REPORT
           PERFORM CLOSE-FILES

           MOVE 0 TO RETURN-CODE

           DISPLAY "BATCH STATUS: COMPLETED"
           DISPLAY "TRANSACTIONS: " WS-TRANSACTIONS
           DISPLAY "APPROVED:     " WS-APPROVED
           DISPLAY "REJECTED:     " WS-REJECTED
           DISPLAY "RETURN-CODE:  0"

           STOP RUN.


       OPEN-FILES.

           OPEN INPUT TRANSACTION-FILE

           IF WS-INPUT-STATUS NOT = "00"
               DISPLAY "ERROR: CANNOT OPEN INPUT FILE"
               DISPLAY "FILE STATUS: " WS-INPUT-STATUS
               MOVE 8 TO RETURN-CODE
               EXIT PARAGRAPH
           END-IF

           OPEN OUTPUT REPORT-FILE

           IF WS-OUTPUT-STATUS NOT = "00"
               DISPLAY "ERROR: CANNOT OPEN OUTPUT FILE"
               DISPLAY "FILE STATUS: " WS-OUTPUT-STATUS
               CLOSE TRANSACTION-FILE
               MOVE 8 TO RETURN-CODE
           END-IF.


       PROCESS-TRANSACTIONS.

           READ TRANSACTION-FILE
               AT END
                   MOVE "Y" TO WS-EOF
               NOT AT END
                   MOVE TRANSACTION-LINE TO TRANSACTION-RECORD
                   ADD 1 TO WS-TRANSACTIONS

                   IF TRX-STATUS = "APPROVED"
                       ADD 1 TO WS-APPROVED
                       ADD TRX-AMOUNT TO WS-APPROVED-AMOUNT
                   ELSE
                       ADD 1 TO WS-REJECTED
                       ADD TRX-AMOUNT TO WS-REJECTED-AMOUNT
                   END-IF

                   ADD TRX-AMOUNT TO WS-TOTAL-AMOUNT
           END-READ.


       WRITE-REPORT.

           MOVE WS-TOTAL-AMOUNT TO WS-TOTAL-DISPLAY
           MOVE WS-APPROVED-AMOUNT TO WS-APPROVED-DISPLAY
           MOVE WS-REJECTED-AMOUNT TO WS-REJECTED-DISPLAY

           MOVE SPACES TO REPORT-LINE
           STRING
               "TRANSACTIONS: "
               WS-TRANSACTIONS
               DELIMITED BY SIZE
               INTO REPORT-LINE
           END-STRING
           WRITE REPORT-LINE

           MOVE SPACES TO REPORT-LINE
           STRING
               "APPROVED: "
               WS-APPROVED
               DELIMITED BY SIZE
               INTO REPORT-LINE
           END-STRING
           WRITE REPORT-LINE

           MOVE SPACES TO REPORT-LINE
           STRING
               "REJECTED: "
               WS-REJECTED
               DELIMITED BY SIZE
               INTO REPORT-LINE
           END-STRING
           WRITE REPORT-LINE

           MOVE SPACES TO REPORT-LINE
           STRING
               "APPROVED AMOUNT: "
               FUNCTION TRIM(WS-APPROVED-DISPLAY)
               DELIMITED BY SIZE
               INTO REPORT-LINE
           END-STRING
           WRITE REPORT-LINE

           MOVE SPACES TO REPORT-LINE
           STRING
               "REJECTED AMOUNT: "
               FUNCTION TRIM(WS-REJECTED-DISPLAY)
               DELIMITED BY SIZE
               INTO REPORT-LINE
           END-STRING
           WRITE REPORT-LINE

           MOVE SPACES TO REPORT-LINE
           STRING
               "TOTAL AMOUNT: "
               FUNCTION TRIM(WS-TOTAL-DISPLAY)
               DELIMITED BY SIZE
               INTO REPORT-LINE
           END-STRING
           WRITE REPORT-LINE.


       CLOSE-FILES.

           CLOSE TRANSACTION-FILE
           CLOSE REPORT-FILE.

