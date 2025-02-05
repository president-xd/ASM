.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    valueA DB 8        ; Define a byte variable with the value 8
    result DB 0        ; Define a byte variable to store the result

.code
main PROC
    mov al, valueA     ; Move the value of valueA into the lower bit register AL
    add al, 2          ; Add 2 to AL, which also affects the status flags (zero flag, sign flag, etc.)
    lahf               ; Load the current status flags into the AH register
    ; Now AH contains the status flags, you can use it as needed

    ; Let's store AH in another register (for demonstration purposes)
    mov result, ah     ; Store the value of AH (status flags) into the result variable

    sahf               ; Store the value in AH back into the status flags

    INVOKE ExitProcess, 0 ; Exit the process with the exit code 0
main ENDP
END main
