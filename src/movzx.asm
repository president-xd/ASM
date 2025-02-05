.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    valueA DB 8
    result DWORD 0

.code
main PROC
    mov al, valueA     ; Move data to lower bit register AL
    movzx eax, al      ; Zero-extend AL to EAX (higher bit register)
    mov result, eax    ; Store the result in memory

    INVOKE ExitProcess, result
main ENDP
END main
