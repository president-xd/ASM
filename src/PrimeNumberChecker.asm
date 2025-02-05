.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    number DWORD 29       ; Number to check
    isPrime BYTE 1        ; Prime flag: 1 = Prime, 0 = Not Prime
    divider DWORD 2       ; Divider starts at 2

.code
main PROC
    mov eax, number       ; Load the number to check into EAX
    cmp eax, 2            ; Check if number < 2
    jl NotPrime           ; Numbers less than 2 are not prime
    cmp eax, 3
    jle PrimeCheckDone    ; 2 and 3 are prime numbers

    ; Initialize for divisibility check
    mov ebx, 2            ; Divider starts at 2

PrimeCheckLoop:
    xor edx, edx          ; Clear the remainder
    div ebx               ; EAX = number / divider, remainder in EDX
    cmp edx, 0            ; Check if remainder is 0
    je NotPrime           ; If divisible, it's not prime
    inc ebx               ; Increment the divider
    mov ecx, ebx          ; Copy divider to ECX
    imul ecx, ecx         ; Calculate divider^2
    cmp ecx, number       ; Compare divider^2 with number
    jl PrimeCheckLoop     ; Continue loop if divider^2 < number

PrimeCheckDone:
    mov isPrime, 1        ; If no divisor found, number is prime
    jmp ExitProgram

NotPrime:
    mov isPrime, 0        ; Set flag to 0 if not prime

ExitProgram:
    INVOKE ExitProcess, 0
main ENDP
END main
