; Write an Assembly program with four nested procedures:
; Main, Sub1, Sub2 and Sub3. Each procedure should:
; 1. Display a message indicating it is currently
;   executing (e.g "Sub1 is running").
; 2. Use call to invoke the next procedure.
; 3. Return control back to the procedure using RET
; Output:
; Main is Running
; Sub1 is running
; sub2 is running
; sub3 is running
; returning to sub2
; returning to sub1
; returning to Main.

.386
.model flat,stdcall
.stack 4096
INCLUDE Irvine32.inc     ; Include Irvine32 library prototypes
INCLUDELIB Irvine32.lib  ; Link Irvine32 library

.data
    main_msg db "Main is running", 0
    sub1_msg db "Sub1 is running", 0
    sub2_msg db "Sub2 is running", 0
    sub3_msg db "Sub3 is running", 0
    return_sub2 db "Returning to Sub2", 0
    return_sub1 db "Returning to Sub1", 0
    return_main db "Returning to Main", 0

.code
main PROC
    ; Display message for Main
    call Clrscr
    mov edx, OFFSET main_msg
    call WriteString
    call Crlf
    ; Call Sub1
    call Sub1
    ; Display returning to Main message
    mov edx, OFFSET return_main
    call WriteString
    call Crlf
    ; Exit program
    exit
main ENDP

Sub1 PROC
    ; Display message for Sub1
    mov edx, OFFSET sub1_msg
    call WriteString
    call Crlf
    ; Call Sub2
    call Sub2
    ; Display returning to Sub1 message
    mov edx, OFFSET return_sub1
    call WriteString
    call Crlf
    ret
Sub1 ENDP

Sub2 PROC
    ; Display message for Sub2
    mov edx, OFFSET sub2_msg
    call WriteString
    call Crlf
    ; Call Sub3
    call Sub3
    ; Display returning to Sub2 message
    mov edx, OFFSET return_sub2
    call WriteString
    call Crlf
    ret
Sub2 ENDP

Sub3 PROC
    ; Display message for Sub3
    mov edx, OFFSET sub3_msg
    call WriteString
    call Crlf
    ret
Sub3 ENDP

END main
