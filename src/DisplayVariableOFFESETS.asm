.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    ; Variables aligned to specific boundaries
    var16 WORD 1234h                    ; 16-bit variable (2-byte aligned)
    var32 DWORD 12345678h               ; 32-bit variable (4-byte aligned)
    var64 QWORD 1234567890ABCDEFh       ; 64-bit variable (8-byte aligned)

.code
main PROC
    ; Displaying addresses of the variables using OFFSET
    mov eax, OFFSET var16               ; Store OFFSET of var16 in EAX
    mov ebx, OFFSET var32               ; Store OFFSET of var32 in EBX
    mov ecx, OFFSET var64               ; Store OFFSET of var64 in ECX
    invoke ExitProcess, 0
main ENDP
END main
