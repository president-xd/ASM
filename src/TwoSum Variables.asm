.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO: DWORD

.data
	var1 DWORD 9 ; Creating a variable named var1 and initializing it with the value of 9

	var2 DWORD 9 ; Creating a variable named var2 and initializing it with the value of 9

	sum DWORD 0 ; Creating a variable named sum and initializing it with the value of 0, to add the above values in it.

.code
main PROC

	mov eax, var1 ; Moving the value of var1 to eax register

	add eax, var2 ; Adding the value of eax(var1) with var2

	mov sum, eax ; Moving the value of eax register to sum variable

	invoke ExitProcess, 0 ; Proper exit process to avoid crashes

main ENDP
END main
