; Author: Osvaldo Hernandez
; Date: 23 September 2022
; This program prompts the user to enter a degree in Farhenheit, converts the latter to Celsius,
; and then outputs the result along with the author's name and a message

; explain your process to doing the conversion: 
; farhenheit is subtracted by 32
; the above is then multiplied by 5
; finally, the result is divided by 9
; conversion f to c: (5 * (F - 32)) / 9

INCLUDE io.h						; header file for input/output
.586								; tells the assembler to recognize 80x86 intructions
.MODEL FLAT							; declares type of memory model
.STACK 4096							; request to the OS to reserve 4096 bytes

.DATA
prompt1		BYTE	"Enter a F temperature", 0		; allocate memory with given string
string		BYTE	40 DUP (?)						; 40 unitialized data fields
number1		DWORD	?								; unitialized memory
number2		DWORD	9								; initialized memory
number3		DWORD	5								; initialized memory
number4		DWORD	32								; initialized memory
result		DWORD	?								; uninitialized memory
resultLb1	BYTE	"        C°, Osvaldo Hernandez -- Ta-daa", 0	; allocate memory with given string


.CODE
;_MainProc PROC
	mov		eax, 0					; clears eax register

	input	prompt1, string, 40		; prompts user to input string
	atod	string					; convert to decimal/integer
	mov		number1, eax			; store integer in memory
	
	; subtract f (string) by 32

	atod	number4					; converts ascii (32) to integer
	mov		eax, number1			; moves integer (F degree) to register

	sub		eax, number4			; F - 32
	mov		ecx, eax				; moves subtraction to sbtrcd memory
	
	; multiply the subtracted by 5

	atod	number3					; convert ascii (5) to integer
	mov		eax, ecx				; move subtracted value (F - 32) to register

	imul	number3					; multiply 5 * (F - 32)

	mov		ecx, eax				; move integer to register
	
	; divide the multiplied by 9

	atod	number2					; convert ascii (9) to integer
	mov		eax, ecx				; move integer to regiser

	idiv	number2					; divide multiplied values by 9

	; output results

	dtoa	result, eax				; convert divided to ascii
	
	output	result, resultLb1		; outputs the results with the author's name and a message

	mov		eax, 0					; clears eax register
	ret
;_MainProc ENDP
END									; end of source code
