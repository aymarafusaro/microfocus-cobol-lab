       IDENTIFICATION DIVISION.
       PROGRAM-ID. ES-DEMO.
    
       DATA DIVISION.
       WORKING-STORAGE SECTION.
    
       01  WS-APPLICATION-NAME  
                              PIC X(30) VALUE "ENTERPRISE COBOL DEMO".
       01  WS-STATUS          
                              PIC X(12) VALUE "READY".
    
       PROCEDURE DIVISION.
    
       MAIN-PROCESS.
    
           DISPLAY "========================================"
           DISPLAY "       ENTERPRISE COBOL DEMO"
           DISPLAY "========================================"
    
           DISPLAY "APPLICATION: " WS-APPLICATION-NAME
           DISPLAY "STATUS:      " WS-STATUS
    
           DISPLAY "APPLICATION EXECUTION STARTED"
    
           MOVE "RUNNING" TO WS-STATUS
    
           DISPLAY "STATUS:      " WS-STATUS
    
           MOVE "COMPLETED" TO WS-STATUS
    
           DISPLAY "STATUS:      " WS-STATUS
           DISPLAY "APPLICATION EXECUTION COMPLETED"
    
           DISPLAY "========================================"
    
           MOVE 0 TO RETURN-CODE
    
           STOP RUN.
    