.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO: DWORD

.data
	CHECK DWORD 9
.code
main PROC
	
	mov eax, CHECK
	dec eax
	dec eax
	dec eax

	mov CHECK, eax

	INVOKE ExitProcess, CHECK

main ENDP
END main
