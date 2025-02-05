.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    matrixA DWORD 1, 2, 3, 4, 5, 6, 7, 8, 9  ; 3x3 Matrix A
    matrixB DWORD 9, 8, 7, 6, 5, 4, 3, 2, 1  ; 3x3 Matrix B
    matrixC DWORD 9 DUP(0)                   ; 3x3 Matrix C (Resultant)
    rows DWORD 3                             ; Number of rows
    cols DWORD 3                             ; Number of columns

.code
main PROC
    ; Pointers for rows and columns
    mov esi, OFFSET matrixA                  ; Pointer to Matrix A
    mov edi, OFFSET matrixB                  ; Pointer to Matrix B
    mov ebx, OFFSET matrixC                  ; Pointer to Matrix C
    mov ecx, rows                            ; Loop through rows

RowLoop:
    push ecx                                 ; Save row counter
    mov ecx, cols                            ; Loop through columns

ColLoop:
    ; Add corresponding elements
    mov eax, [esi]                           ; Load element from Matrix A
    add eax, [edi]                           ; Add element from Matrix B
    mov [ebx], eax                           ; Store result in Matrix C

    ; Move to the next element
    add esi, TYPE matrixA                    ; Increment pointer for Matrix A
    add edi, TYPE matrixB                    ; Increment pointer for Matrix B
    add ebx, TYPE matrixC                    ; Increment pointer for Matrix C
    loop ColLoop                             ; Loop for columns

    pop ecx                                  ; Restore row counter
    loop RowLoop                             ; Loop for rows

    ; Exit
    INVOKE ExitProcess, 0
main ENDP
END main
