.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO: DWORD

.data
	Array DWORD 2, 4, 5, 6 
	DIFF DWORD ?
.code
main PROC
	
	mov eax, [Array]
	sub eax, [Array+4] 
	mov DIFF, eax

	mov eax, [Array+8]
	sub eax, [Array+12]
	sub DIFF, eax

	INVOKE ExitProcess, DIFF

main ENDP
END main
