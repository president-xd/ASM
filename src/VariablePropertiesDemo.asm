.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    ; Define variables and arrays with various alignments
    var8 BYTE 0FFh                        ; 8-bit variable
    var16 WORD 1234h                      ; 16-bit variable (2-byte)
    var32 DWORD 12345678h                 ; 32-bit variable (4-byte)
    var64 QWORD 1234567890ABCDEFh         ; 64-bit variable (8-byte)
    arr8 BYTE 10 DUP(0AAh)                ; Array of 10 bytes
    arr16 WORD 5 DUP(0BBBBh)              ; Array of 5 words (16-bit)
    arr32 DWORD 4 DUP(0CCCCCCCCh)         ; Array of 4 dwords (32-bit)
    outputFmt db "Value: %d, Address: %X, Total Size: %d", 0  ; Define output format string

.code
main PROC
    ; Demonstrate TYPE, OFFSET, and SIZEOF
    ; 1. Retrieve and display TYPE (size of a single element)
    mov eax, TYPE var8                    ; eax = size of single element in var8 (1 byte)
    mov ebx, TYPE arr16                   ; ebx = size of single element in arr16 (2 bytes)

    ; 2. Retrieve and display OFFSET (address of the variable)
    mov ecx, OFFSET var16                 ; ecx = memory address of var16
    mov edx, OFFSET arr32                 ; edx = memory address of arr32

    ; 3. Retrieve and display SIZEOF (total size of the variable)
    mov esi, SIZEOF arr8                  ; esi = total size of arr8 (10 bytes)
    mov edi, SIZEOF arr32                 ; edi = total size of arr32 (16 bytes)

    invoke ExitProcess, 0
main ENDP
END main
