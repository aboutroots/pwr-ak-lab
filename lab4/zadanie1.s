.data
	.comm INT, 4
	.comm CHAR, 1
	.comm WSKAZNIK, 8

  # instrukcje formatujace
	formatD: .asciz "%d"
	formatC: .asciz "%c"
	formatS: .asciz "%s"

  # instrukcja dla printfa
	format_printf: .ascii "%d, %c, %s \n"

.text
.globl main
main:

  # scanf("%d" , &INT);
	push $INT
	push $formatD
	call scanf
	add $8, %esp

  # scanf("%c", &CHAR);
	push $CHAR
	push $formatC
	call scanf
	add $8, %esp

  # scanf("%s", &WSKAZNIK)
	push $WSKAZNIK
	push $formatS
	call scanf
	add $8, %esp

  # printf("%d, %c, %s \n" , INT, CHAR, *WSKAZNIK)
	push $WSKAZNIK
	push CHAR
	push INT
	push $format_printf
	call printf
	add $16, %esp
ret
