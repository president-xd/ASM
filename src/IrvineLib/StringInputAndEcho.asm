.386
INCLUDE Irvine32.inc     ; Include Irvine32 library prototypes
INCLUDELIB Irvine32.lib  ; Link Irvine32 library
ExitProcess PROTO, dwExitCode:DWORD

.data
    message BYTE "Please enter a string : ", 0   ; Define the string, null-terminated

    input_buffer BYTE 128 DUP(0)                 ; Reserve 128 bytes for input
    output_message BYTE "The value you entered was : ", 0  ; Define the string, null-terminated

.code
main PROC
    mov edx, OFFSET message                      ; Address of the Prompt Message
    call WriteString                             ; Call Irvine Library's WriteString function

    ; Call ReadString function to get user input
    mov edx, OFFSET input_buffer                 ; Address of the input buffer
    mov ecx, 128                                 ; Maximum input length
    call ReadString                              ; Call Irvine Library's ReadString function

    mov edx, OFFSET output_message               ; Address of the output_message variable
    call WriteString                             ; Print the output message

    ; Print the entered string
    mov edx, OFFSET input_buffer                 ; Address of the input buffer
    call WriteString

    invoke ExitProcess, 0                        ; Exit the program
main ENDP
END main
