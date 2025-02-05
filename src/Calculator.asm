.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    valueA DB 8
    valueB DB 4
    result DB 0
    operation DB '/'

.code
main PROC
    mov al, valueA
    mov bl, valueB
    cmp operation, '+'
    je AddOperation
    cmp operation, '-'
    je SubtractOperation
    cmp operation, '*'
    je MultiplyOperation
    cmp operation, '/'
    je DivideOperation
    jmp Exit

AddOperation:
    add al, bl
    jmp StoreResult

SubtractOperation:
    sub al, bl
    jmp StoreResult

MultiplyOperation:
    movzx eax, al
    movzx ebx, bl
    imul eax, ebx
    jmp StoreResult

DivideOperation:
    movzx eax, al
    movzx ebx, bl
    xor edx, edx ; To clear EDX before Divison
    div bl ; Using BL for division, Al = Al / Bl
    jmp StoreResult

StoreResult:
    mov result, al

Exit:
    INVOKE ExitProcess, result
main ENDP
END main
