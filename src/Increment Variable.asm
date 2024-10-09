.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO: DWORD

.data
	CHECK DWORD 9
.code
main PROC
	
	mov eax, CHECK
	inc eax
	inc eax
	inc eax

	mov CHECK, eax

	INVOKE ExitProcess, CHECK

main ENDP
END main
