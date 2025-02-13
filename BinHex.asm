****JCL to submit job
//ASMJOB   JOB  (ACCT),'NAME',NOTIFY=&SYSUID
//ASMSTEP  EXEC PGM=ASMA90
//SYSPRINT DD  SYSOUT=*
//SYSIN    DD  *
         TITLE 'Binary to Hexadecimal Example'
         L     R1,=H'1A'  * Load hexadecimal value 1A into R1
         SR    R2, R2     * Clear R2
         SR    R3, R3     * Clear R3

         * Convert hexadecimal to binary
         L     R2,=H'0'   * Initialize R2 with 0
         L     R3,=H'4'   * Set R3 for 4 bits (example of 4-bit binary)

LOOP     SLL   R1,1      * Shift left R1 (multiplying by 2)
         ADD   R2,R2,R3   * Add the 4 bits to R2
         C     R1,=H'00'  * Compare R1 with 0
         BE    DONE       * If R1 is zero, exit loop
         B     LOOP       * Loop again

DONE     ST    R2,RESULT * Store the result
         BSD   FINISH     * Branch to finish

RESULT   DC    F'0'       * Result storage
FINISH   END
/*
// 
