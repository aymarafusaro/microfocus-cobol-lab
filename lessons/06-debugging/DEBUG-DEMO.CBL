       IDENTIFICATION DIVISION.
       PROGRAM-ID. DEBUG-DEMO.
    
       ENVIRONMENT DIVISION.
    
       DATA DIVISION.
       WORKING-STORAGE SECTION.
    
       01  WS-TRANSACTION-COUNT    PIC 9(3) VALUE 0.
       01  WS-TOTAL-AMOUNT         PIC 9(8)V99 VALUE 0.
       01  WS-CURRENT-AMOUNT       PIC 9(8)V99 VALUE 0.
    
       PROCEDURE DIVISION.
    
       MAIN-PROCESS.
    
           PERFORM PROCESS-TRANSACTION
           PERFORM PROCESS-TRANSACTION
           PERFORM PROCESS-TRANSACTION
    
           DISPLAY "========================================"
           DISPLAY "       DEBUGGING DEMONSTRATION"
           DISPLAY "========================================"
           DISPLAY "TRANSACTIONS: " WS-TRANSACTION-COUNT
           DISPLAY "TOTAL AMOUNT: " WS-TOTAL-AMOUNT
           DISPLAY "========================================"
    
           STOP RUN.
    
       PROCESS-TRANSACTION.
    
           MOVE 0 TO WS-CURRENT-AMOUNT
           
           ADD 100.00 TO WS-CURRENT-AMOUNT
    
           ADD 1 TO WS-TRANSACTION-COUNT
    
           ADD WS-CURRENT-AMOUNT TO WS-TOTAL-AMOUNT.
    
    