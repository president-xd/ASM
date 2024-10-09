.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO: DWORD

.data
	valueA DWORD 3
	valueB DWORD 8
	valueC DWORD 4
	valueD DWORD 6

	OPERATION DWORD 0

.code
main PROC
	
	; Caculate OPERATION = ( A + B ) - ( C + D )

	mov eax, valueA
	mov ebx, valueB
	add eax, ebx

	mov ecx, valueC
	mov edx, valueD
	add ecx, edx

	sub eax, ecx

	mov OPERATION, eax


	INVOKE ExitProcess, OPERATION

main ENDP
END main
