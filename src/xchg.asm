.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    valueA DB 8        ; Define a byte variable with the value 8
    valueB DB 4        ; Define a byte variable with the value 4
    resultA DB 0       ; Define a byte variable to store the result of valueA
    resultB DB 0       ; Define a byte variable to store the result of valueB

.code
main PROC
    mov al, valueA     ; Move the value of valueA into the AL register
    mov bl, valueB     ; Move the value of valueB into the BL register
    xchg al, bl        ; Exchange the values of AL and BL

    mov resultA, al    ; Store the new value of AL (originally valueB) into resultA
    mov resultB, bl    ; Store the new value of BL (originally valueA) into resultB

    INVOKE ExitProcess, 0 ; Exit the process with the exit code 0
main ENDP
END main
