.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO: DWORD

.data
	Array DWORD 2, 4, 5, 6
	SUM DWORD ?
.code
main PROC
	
	mov eax, [Array]
	add eax, [Array+4] 
	mov SUM, eax

	mov eax, [Array+8]
	add eax, [Array+12]
	add SUM, eax

	INVOKE ExitProcess, SUM



main ENDP
END main
