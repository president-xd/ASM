.386
INCLUDE Irvine32.inc     ; Include Irvine32 library prototypes
INCLUDELIB Irvine32.lib  ; Link Irvine32 library
ExitProcess PROTO, dwExitCode:DWORD

.data
    message BYTE "Hello, World!", 0   ; Define the string, null-terminated

.code
main PROC
    lea edx, message                  ; Load the address of the string into EDX
    call WriteString                  ; Print the string to the console
    call Crlf                         ; Move to the next line
    invoke ExitProcess, 0             ; Exit the program
main ENDP
END main
