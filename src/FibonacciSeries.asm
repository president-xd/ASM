.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    fibArray DWORD 1, 1, 0, 0, 0, 0, 0  ; Array to store Fibonacci numbers
    numFib DWORD 7                      ; Total number of Fibonacci numbers

.code
main PROC
    mov esi, OFFSET fibArray            ; Load the address of the Fibonacci array
    mov ecx, 5                          ; Loop counter for remaining numbers (7 - 2 = 5)
    mov eax, [esi]                      ; Load Fib(1) into EAX
    mov ebx, [esi + 4]                  ; Load Fib(2) into EBX
    lea edi, [esi + 8]                  ; Point to Fib(3)

FibonacciLoop:
    add eax, ebx                        ; Fib(n) = Fib(n-1) + Fib(n-2)
    mov [edi], eax                      ; Store the result in Fib(n)
    mov eax, ebx                        ; Update Fib(n-1) to Fib(n-2)
    mov ebx, [edi]                      ; Update Fib(n) to Fib(n-1)
    add edi, 4                          ; Move to the next position in the array
    loop FibonacciLoop                  ; Repeat until ECX becomes 0

    ; Exit the program
    INVOKE ExitProcess, 0
main ENDP
END main
