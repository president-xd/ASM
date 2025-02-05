.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    array DWORD 1, 2, 3, 4, 5  ; Array elements
    sum DWORD 0                ; Initialize sum to 0
    count DWORD 5              ; Number of elements in the array

.code
main PROC
    mov esi, OFFSET array      ; Load the address of the array into ESI
    mov ecx, count             ; Load the number of elements into ECX
    xor eax, eax               ; Clear EAX to use as a running sum

L1:
    add eax, [esi]             ; Add the current array element to EAX
    add esi, TYPE array        ; Move to the next element
    loop L1                    ; Decrement ECX and loop if ECX > 0

    mov sum, eax               ; Store the final sum in 'sum'

    ; Exit
    INVOKE ExitProcess, sum
main ENDP
END main
