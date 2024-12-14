       IDENTIFICATION DIVISION.
       PROGRAM-ID. Calculator.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NUM1               PIC 9(5)V99.
       01 WS-NUM2               PIC 9(5)V99.
       01 WS-RESULT             PIC 9(10)V99.
       01 WS-OPERATION          PIC X.
       01 WS-CONTINUE           PIC X VALUE 'Y'.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "Welcome to COBOL Calculator".
           PERFORM UNTIL WS-CONTINUE NOT = 'Y'
               PERFORM GET-INPUT
               PERFORM PERFORM-CALCULATION
               PERFORM DISPLAY-RESULT
               PERFORM ASK-CONTINUE
           END-PERFORM
           DISPLAY "Thank you for using the calculator. Goodbye!"
           STOP RUN.

       GET-INPUT.
           DISPLAY "Enter first number: " WITH NO ADVANCING
           ACCEPT WS-NUM1.
           DISPLAY "Enter second number: " WITH NO ADVANCING
           ACCEPT WS-NUM2.
           DISPLAY "Enter operation (+, -, *, /): " WITH NO ADVANCING
           ACCEPT WS-OPERATION.

       PERFORM-CALCULATION.
           EVALUATE WS-OPERATION
               WHEN "+"
                   COMPUTE WS-RESULT = WS-NUM1 + WS-NUM2
               WHEN "-"
                   COMPUTE WS-RESULT = WS-NUM1 - WS-NUM2
               WHEN "*"
                   COMPUTE WS-RESULT = WS-NUM1 * WS-NUM2
               WHEN "/"
                   IF WS-NUM2 NOT = 0
                       COMPUTE WS-RESULT = WS-NUM1 / WS-NUM2
                   ELSE
                       DISPLAY "Error: Division by zero."
                       MOVE 0 TO WS-RESULT
                   END-IF
               WHEN OTHER
                   DISPLAY "Invalid operation. Please try again."
                   MOVE 0 TO WS-RESULT
           END-EVALUATE.

       DISPLAY-RESULT.
           DISPLAY "Result: " WS-RESULT.

       ASK-CONTINUE.
           DISPLAY "Do you want to perform another calculation? (Y/N): " WITH NO ADVANCING
           ACCEPT WS-CONTINUE.
           IF WS-CONTINUE NOT = 'Y'
               DISPLAY "Exiting the calculator..."
           END-IF.
