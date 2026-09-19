       IDENTIFICATION DIVISION.
       PROGRAM-ID. TEST-DEMO.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT TRANSACTION-FILE
               ASSIGN TO 
               "lessons/07-testing/data/input/transactions.dat"
               ORGANIZATION IS SEQUENTIAL
               FILE STATUS IS WS-FILE-STATUS.

           SELECT TEST-RESULT-FILE
               ASSIGN TO 
               "lessons/07-testing/data/output/test-results.txt"
               ORGANIZATION IS LINE SEQUENTIAL
               FILE STATUS IS WS-RESULT-STATUS.

       DATA DIVISION.
       FILE SECTION.

       FD  TRANSACTION-FILE
           RECORD CONTAINS 40 CHARACTERS
           RECORDING MODE IS F.

       COPY "copybooks/TRANSACTION-RECORD.CPY".

       FD  TEST-RESULT-FILE.

       01  TEST-RESULT-RECORD PIC X(80).

       WORKING-STORAGE SECTION.

       01  WS-FILE-STATUS       PIC XX VALUE "00".
       01  WS-RESULT-STATUS     PIC XX VALUE "00".
       01  WS-EOF               PIC X VALUE "N".

       01  WS-TRANSACTION-COUNT PIC 9(3) VALUE 0.
       01  WS-APPROVED-COUNT    PIC 9(3) VALUE 0.
       01  WS-REJECTED-COUNT    PIC 9(3) VALUE 0.
       01  WS-TOTAL-AMOUNT      PIC 9(8)V99 VALUE 0.
       01  WS-TOTAL-AMOUNT-DISPLAY PIC Z(7)9.99.

       PROCEDURE DIVISION.

       MAIN-PROCESS.

           OPEN INPUT TRANSACTION-FILE

           IF WS-FILE-STATUS NOT = "00"
               DISPLAY "TEST ERROR: CANNOT OPEN INPUT FILE"
               MOVE 1 TO RETURN-CODE
               STOP RUN
           END-IF

           OPEN OUTPUT TEST-RESULT-FILE

           IF WS-RESULT-STATUS NOT = "00"
               DISPLAY "TEST ERROR: CANNOT OPEN RESULT FILE"
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

           PERFORM WRITE-TEST-RESULTS

           CLOSE TRANSACTION-FILE
           CLOSE TEST-RESULT-FILE

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

       WRITE-TEST-RESULTS.

           MOVE WS-TOTAL-AMOUNT TO WS-TOTAL-AMOUNT-DISPLAY
           
           MOVE SPACES TO TEST-RESULT-RECORD
           STRING
               "TRANSACTIONS: "
               WS-TRANSACTION-COUNT
               DELIMITED BY SIZE
               INTO TEST-RESULT-RECORD
           END-STRING
           WRITE TEST-RESULT-RECORD

           MOVE SPACES TO TEST-RESULT-RECORD
           STRING
               "APPROVED: "
               WS-APPROVED-COUNT
               DELIMITED BY SIZE
               INTO TEST-RESULT-RECORD
           END-STRING
           WRITE TEST-RESULT-RECORD

           MOVE SPACES TO TEST-RESULT-RECORD
           STRING
               "REJECTED: "
               WS-REJECTED-COUNT
               DELIMITED BY SIZE
               INTO TEST-RESULT-RECORD
           END-STRING
           WRITE TEST-RESULT-RECORD

           MOVE SPACES TO TEST-RESULT-RECORD
           STRING
               "TOTAL AMOUNT: "
               FUNCTION TRIM(WS-TOTAL-AMOUNT-DISPLAY)
               DELIMITED BY SIZE
               INTO TEST-RESULT-RECORD
           END-STRING
           WRITE TEST-RESULT-RECORD.
