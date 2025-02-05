    ; a. Iterate over the array and compute the sum of all even numbers.
    ; b. Compute the sum of all odd numbers.
    ; c. Check if the sum of even numbers is greater than the sum of odd numbers.
    ;    If the sum of even numbers is greater, display a message "Even sum is greater".
    ;    Otherwise, display "Odd sum is greater".
    ; d. Use a loop to iterate through the array and a jump instruction (JZ, JNZ, etc.) to compare the sums.

.386
INCLUDE Irvine32.inc     ; Include Irvine32 library prototypes
INCLUDELIB Irvine32.lib  ; Link Irvine32 library
ExitProcess PROTO, dwExitCode:DWORD

.data
    arr DWORD 5, 12, 7, 9, 4, 10, 8, 3, 2, 15  ; Array of numbers
    evenSum DWORD 0                            ; Variable to store the sum of even numbers
    oddSum DWORD 0                             ; Variable to store the sum of odd numbers
    msgEven BYTE "Even sum is greater", 0      ; Message for even sum greater
    msgOdd BYTE "Odd sum is greater", 0        ; Message for odd sum greater

.code
main PROC
    mov esi, OFFSET arr            ; Pointer to the start of the array
    mov ecx, LENGTHOF arr          ; Loop counter for the array size

ComputeSums:
    mov eax, [esi]                 ; Load the current element into EAX
    test eax, 1                    ; Test if the number is even or odd
    jz EvenNumber                  ; If the least significant bit is 0, it's even
OddNumber:
    add oddSum, eax                ; Add to oddSum
    jmp NextElement
EvenNumber:
    add evenSum, eax               ; Add to evenSum
NextElement:
    add esi, TYPE DWORD            ; Move to the next element
    loop ComputeSums               ; Loop for all elements

    ; Compare evenSum and oddSum
    mov eax, evenSum
    mov ebx, oddSum
    cmp eax, ebx                   ; Compare evenSum with oddSum
    jg DisplayEvenMsg              ; If evenSum > oddSum, jump to display even message
DisplayOddMsg:
    mov edx, OFFSET msgOdd         ; Display "Odd sum is greater"
    call WriteString
    jmp ExitProgram
DisplayEvenMsg:
    mov edx, OFFSET msgEven        ; Display "Even sum is greater"
    call WriteString

ExitProgram:
    call Crlf                      ; Move to the next line
    invoke ExitProcess, 0          ; Exit the program
main ENDP
END main
