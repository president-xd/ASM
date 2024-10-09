.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO: DWORD

.data
	CHECK DWORD 9
.code
main PROC
	
	neg CHECK

	INVOKE ExitProcess, CHECK

main ENDP
END main
