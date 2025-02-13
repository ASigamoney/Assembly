//EMAIL JOB (JW),'Test Mail',CLASS=A,MSGCLASS=A    
//SMTP  EXEC PGM=EMAIL                             
//STDOUT DD  SYSOUT=*                              
//SYSIN  DD  *                                     
HELLO        CSECT
            SAVE (14, 12)    ; Save R1 through R14 to the save area with an offset of 12
            BASR    R12,0     ; Perform a base register save
            LA      R12,SAVEA  ; Load the address of the save area
            ST      R13,SAVE+4 ; Store the value of R13 in the save area (12 words from R1)
    SAYIT    WTO     'HELLO WORLD'
            L       R13,SAVE+4 ; Restore the value of R13 from the save area
            RETURN (14,12),RC=0 ; Restore registers R1 through R14
            LTORG
END
SAVEA       DS      18F     ; Save area with a total length of 18 words
/*
