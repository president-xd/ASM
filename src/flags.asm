.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    valueA DB 0xFF       ; Define a byte variable with a value that will cause a carry
    valueB DB 1          ; Define a byte variable to add
    result DB 0          ; Define a byte variable to store the result
    flags DB 0           ; Define a byte variable to store flag results

.code
main PROC
    ; Carry Flag (CF) example
    mov al, valueA       ; Move valueA to AL
    add al, valueB       ; Add valueB to AL (0xFF + 1 = 0x00 with carry)
    jc carry_set         ; Jump if carry flag is set

    ; Overflow Flag (OF) example
    mov al, 127          ; Move 127 to AL (largest positive signed byte)
    add al, 1            ; Add 1 to AL (127 + 1 = 128, overflow occurs)
    jo overflow_set      ; Jump if overflow flag is set

    ; Sign Flag (SF) example
    mov al, -1           ; Move -1 to AL (0xFF in hexadecimal)
    test al, al          ; Test the value of AL
    js sign_set          ; Jump if sign flag is set

    ; Zero Flag (ZF) example
    mov al, 1            ; Move 1 to AL
    sub al, 1            ; Subtract 1 from AL (1 - 1 = 0)
    jz zero_set          ; Jump if zero flag is set

    ; Exit if no flag is set (should not reach here)
    jmp Exit

carry_set:
    mov flags, 'C'       ; Store 'C' in flags to indicate carry flag set
    jmp Exit

overflow_set:
    mov flags, 'O'       ; Store 'O' in flags to indicate overflow flag set
    jmp Exit

sign_set:
    mov flags, 'S'       ; Store 'S' in flags to indicate sign flag set
    jmp Exit

zero_set:
    mov flags, 'Z'       ; Store 'Z' in flags to indicate zero flag set

Exit:
    mov result, al       ; Store the final result in result (though it might not be meaningful here)
    INVOKE ExitProcess, 0
main ENDP
END main
