.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    Array DD 2, 4, 6, 8, 10  ; Define an array with five elements

.code
main PROC
    mov eax, Array           ; Load the first element of Array into EAX
    mov ebx, 2               ; Load 2 into EBX
    imul eax, ebx            ; Multiply EAX by EBX
    mov Array, eax           ; Store the result back into the first element of Array

    mov eax, Array+4         ; Load the second element of Array into EAX
    mov ebx, 2               ; Load 2 into EBX
    imul eax, ebx            ; Multiply EAX by EBX
    mov Array+4, eax         ; Store the result back into the second element of Array

    mov eax, Array+8         ; Load the third element of Array into EAX
    mov ebx, 2               ; Load 2 into EBX
    imul eax, ebx            ; Multiply EAX by EBX
    mov Array+8, eax         ; Store the result back into the third element of Array

    mov eax, Array+12        ; Load the fourth element of Array into EAX
    mov ebx, 2               ; Load 2 into EBX
    imul eax, ebx            ; Multiply EAX by EBX
    mov Array+12, eax        ; Store the result back into the fourth element of Array

    mov eax, Array+16        ; Load the fifth element of Array into EAX
    mov ebx, 2               ; Load 2 into EBX
    imul eax, ebx            ; Multiply EAX by EBX
    mov Array+16, eax        ; Store the result back into the fifth element of Array

    invoke ExitProcess, 0    ; Exit the process with exit code 0
main ENDP
END main
