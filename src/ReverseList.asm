.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    array DWORD 1, 2, 3, 4, 5    ; Original array
    reversed DWORD 5 DUP(0)      ; Array to hold reversed elements
    count DWORD 5                ; Number of elements in the array

.code
main PROC
    mov esi, OFFSET array        ; Pointer to the start of the original array
    mov edi, OFFSET reversed     ; Pointer to the start of the reversed array
    mov ecx, count               ; Loop counter for array size

ReverseLoop:
    mov ebx, ecx                 ; Copy loop counter to EBX
    dec ebx                      ; EBX = ECX - 1
    mov eax, [esi + ebx * 4]     ; Load element from the end of the original array
    mov [edi], eax               ; Store it in the reversed array
    add edi, 4                   ; Move to the next position in the reversed array
    loop ReverseLoop             ; Decrement ECX and repeat

    ; Exit the program
    INVOKE ExitProcess, 0
main ENDP
END main
