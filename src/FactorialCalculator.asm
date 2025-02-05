.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    n DWORD 5           ; Number to calculate factorial for
    result DWORD 1      ; Initialize result to 1

.code
main PROC
    mov ecx, n          ; Load the value of n into ECX (loop counter)
    mov eax, result     ; Load result into EAX

L1:
    mul ecx             ; Multiply EAX by ECX
    loop L1             ; Decrement ECX and repeat if ECX > 0

    mov result, eax     ; Store the final result back into 'result'

    ; Exit
    INVOKE ExitProcess, result
main ENDP
END main
