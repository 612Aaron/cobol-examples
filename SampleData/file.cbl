IDENTIFICATION DIVISION.
PROGRAM-ID. Calculator.

ENVIRONMENT DIVISION.

DATA DIVISION.
WORKING-STORAGE SECTION.
   01 NUM1         PIC 9(5)V9(2) VALUE 0.
   01 NUM2         PIC 9(5)V9(2) VALUE 0.
   01 RESULT       PIC 9(6)V9(2) VALUE 0.
   01 OPERATOR     PIC X VALUE SPACE.

PROCEDURE DIVISION.
   DISPLAY "Welcome to the COBOL Calculator!".
   
   DISPLAY "Enter the first number: " WITH NO ADVANCING.
   ACCEPT NUM1.
   
   DISPLAY "Enter the operator (+, -, *, /): " WITH NO ADVANCING.
   ACCEPT OPERATOR.
   
   DISPLAY "Enter the second number: " WITH NO ADVANCING.
   ACCEPT NUM2.

   EVALUATE OPERATOR
       WHEN "+" 
           COMPUTE RESULT = NUM1 + NUM2
       WHEN "-" 
           COMPUTE RESULT = NUM1 - NUM2
       WHEN "*" 
           COMPUTE RESULT = NUM1 * NUM2
       WHEN "/" 
           IF NUM2 = 0
               DISPLAY "Error: Division by zero is not allowed."
               STOP RUN
           ELSE
               COMPUTE RESULT = NUM1 / NUM2
           END-IF
       WHEN OTHER
           DISPLAY "Error: Invalid operator."
           STOP RUN
   END-EVALUATE.

   DISPLAY "The result of " NUM1 " " OPERATOR " " NUM2 " is: " RESULT.

   STOP RUN.
