       IDENTIFICATION DIVISION.
       PROGRAM-ID. COPYBOOK-DEMO.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       COPY "copybooks/TRANSACTION-RECORD.CPY".

       PROCEDURE DIVISION.

           MOVE "000005"     TO TRX-ID
           MOVE "ACC0007890" TO TRX-ACCOUNT
           MOVE 1500.75      TO TRX-AMOUNT
           MOVE "APPROVED"   TO TRX-STATUS
           MOVE "ARS "       TO TRX-CURRENCY

           DISPLAY "========================================"
           DISPLAY "       COPYBOOK DEMONSTRATION"
           DISPLAY "========================================"
           DISPLAY "TRANSACTION: " TRX-ID
           DISPLAY "ACCOUNT:     " TRX-ACCOUNT
           DISPLAY "AMOUNT:      " TRX-AMOUNT
           DISPLAY "STATUS:      " TRX-STATUS
           DISPLAY "CURRENCY:    " TRX-CURRENCY
           DISPLAY "========================================"

           STOP RUN.
           