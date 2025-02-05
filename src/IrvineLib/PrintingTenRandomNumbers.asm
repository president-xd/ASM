.386
INCLUDE Irvine32.inc     ; Include Irvine32 library prototypes
INCLUDELIB Irvine32.lib  ; Link Irvine32 library
ExitProcess PROTO, dwExitCode:DWORD

.data
    ; Define your variables and data here

.code
main PROC
    mov ecx, 10         ; Set loop counter to 10

L1:
    mov eax, 100        ; Set the upper limit for RandomRange
    call RandomRange    ; Call Irvine Library's RandomRange function
    call WriteInt       ; Call Irvine Library's WriteInt function to print the integer
    call Crlf           ; Call Irvine Library's Crlf function to move to the next line
    loop L1             ; Loop back if ECX is not zero

    invoke ExitProcess, 0   ; Exit the program
main ENDP
END main
