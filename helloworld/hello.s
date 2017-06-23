SYSEXIT		= 1
SYSREAD		= 3
SYSWRITE 	= 4
STDOUT		= 1
EXIT_SUCCESS	= 0

.align 32

.text
	text_hello: .ascii "\n Hello friend. \n"
	text_hello_length= . - text_hello #dzieki temu otrzymuje poprawna dlugosc napisu, odejmujac adres miejsca w kodzie gdzie deklarowalem text_hello od aktualnego miejsca

.global _start #punkt wejscia programu

_start:
	mov $SYSWRITE, %eax
	mov $STDOUT, %ebx
	mov $text_hello, %ecx
	mov $text_hello_length, %edx

	int $0x80
	
	mov $SYSEXIT, %eax
	mov $EXIT_SUCCESS, %ebx

	int $0x80
	
