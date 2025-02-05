.386
INCLUDE Irvine32.inc     ; Include Irvine32 library prototypes
INCLUDELIB Irvine32.lib  ; Link Irvine32 library
ExitProcess PROTO, dwExitCode:DWORD

.data
    ; Define your variables and data here

.code
main PROC
    call Clrscr         ; Clears the console screen
    mov eax, 500
    call Delay          ; Pauses for 500 milliseconds
    call DumpRegs       ; Dumps the CPU registers to the screen
    invoke ExitProcess, 0
main ENDP
END main
