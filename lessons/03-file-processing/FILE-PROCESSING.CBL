       IDENTIFICATION DIVISION.
       PROGRAM-ID. FILE-PROCESSING.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT TRANSACTION-FILE
               ASSIGN TO 
               "lessons/03-file-processing/data/input/transactions.dat"
               ORGANIZATION IS SEQUENTIAL
               FILE STATUS IS WS-FILE-STATUS.

       DATA DIVISION.
       FILE SECTION.

       FD  TRANSACTION-FILE
           RECORD CONTAINS 40 CHARACTERS
           RECORDING MODE IS F.

       COPY "copybooks/TRANSACTION-RECORD.CPY".

       WORKING-STORAGE SECTION.

       01  WS-FILE-STATUS      PIC XX.
       01  WS-EOF              PIC X VALUE "N".

       PROCEDURE DIVISION.

           OPEN INPUT TRANSACTION-FILE

           IF WS-FILE-STATUS NOT = "00"
               DISPLAY "ERROR: CANNOT OPEN TRANSACTION FILE"
               DISPLAY "FILE STATUS: " WS-FILE-STATUS
               STOP RUN
           END-IF

           PERFORM UNTIL WS-EOF = "Y"

               READ TRANSACTION-FILE
                   AT END
                       MOVE "Y" TO WS-EOF
                   NOT AT END
                       DISPLAY "TRANSACTION: " TRX-ID
                       DISPLAY "ACCOUNT:     " TRX-ACCOUNT
                       DISPLAY "AMOUNT:      " TRX-AMOUNT
                       DISPLAY "STATUS:      " TRX-STATUS
                       DISPLAY "CURRENCY:    " TRX-CURRENCY
                       DISPLAY "-------------------------------------"
               END-READ

           END-PERFORM

           CLOSE TRANSACTION-FILE

           DISPLAY "FILE PROCESSING COMPLETED."

           STOP RUN.
