SYSEXIT		= 1
SYSREAD		= 3
SYSWRITE 	= 4
STDOUT		= 1
STDIN		= 0
EXIT_SUCCESS	= 0


.align 32

.text
	text_hello: .ascii "\wpisales: \n"
	text_hello_length= . - text_hello
.data
	tablica: .space 512
.global _start 

_start:
	mov $0, %edi

	mov $SYSREAD, %eax
	mov $STDIN, %ebx
	mov $tablica, %ecx
	mov $512, %edx
	
	int $0x80
	
	mov $SYSWRITE, %eax
        mov $STDOUT, %ebx
        mov $text_hello, %ecx
        mov $text_hello_length, %edx

        int $0x80

        mov $SYSWRITE, %eax
        mov $STDOUT, %ebx
        mov $tablica, %ecx 
	mov $512, %edx

        int $0x80
	
	
	mov $SYSEXIT, %eax
	mov $EXIT_SUCCESS, %ebx

	int $0x80



