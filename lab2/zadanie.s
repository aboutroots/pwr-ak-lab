SYSEXIT		    = 1
SYSREAD	    	= 3
SYSWRITE     	= 4
STDOUT	     	= 1
STDIN	       	= 0
EXIT_SUCCESS	= 0

MALE_POCZATEK 	= 0x61
MALE_KONIEC   	= 0x7A
DUZE_POCZATEK 	= 0x41
DUZE_KONIEC   	= 0x5A
CYFRY_POCZATEK 	= 0x30
CYFRY_KONIEC  	= 0x39

DOPELNIENIE_DLA_CYFR = 105
ENDOFFILE 	         = 0


.bss
	.comm bufor,1

.text
	text_hello: .ascii "\wpisales: \n"
	text_hello_length= . - text_hello

.global _start

_start:
	mov $0, %edi

petla_wczytywania:

	mov $SYSREAD, %eax
	mov $STDIN, %ebx
	mov $bufor, %ecx
	mov $1, %edx

	int $0x80

	#sprawdzam cyz to koniec pliku, zeby zakonczyc:
	mov $ENDOFFILE, %ebx
	cmp %ebx, %eax
		je ending

	#sprawdzam czy to cyfra, duza lub mala litera:
	mov $CYFRY_POCZATEK, %ebx
	mov bufor, %eax
	cmp %ebx, %eax
		jge cyfra

	jmp naekran

naekran:

	#wyswietlam gotowe juz na ekran:

  mov $SYSWRITE, %eax
  mov $STDOUT, %ebx
  mov $bufor, %ecx
  mov $1, %edx

  int $0x80

	inc %edi
	jmp petla_wczytywania

cyfra:
	#czy lapie sie w cyfry?
	mov $CYFRY_KONIEC, %ebx
	mov bufor, %eax
	cmp %ebx, %eax
		#jesli nie, to moze jest duza litera:
		jg duzalitera


	mov bufor, %ah
	mov $DOPELNIENIE_DLA_CYFR, %bh
	sub %ah, %bh
	mov %bh, bufor

	jmp naekran

duzalitera:
	#czy lapie sie w zakres malych?
	mov $DUZE_POCZATEK, %ebx
	mov bufor, %eax
	cmp %ebx, %eax
		jl naekran


	#czy lapie sie w zakres duzych?
	mov $DUZE_KONIEC, %ebx
	mov bufor, %eax
	cmp %ebx, %eax
		#jesli nie, to moze jest mala:
		jg malalitera

	add $0x20, bufor
	jmp naekran

malalitera:
	#czy lapie sie w zakres malych?
	mov $MALE_POCZATEK, %ebx
	mov bufor, %eax
	cmp %ebx, %eax
		jl naekran

	mov $MALE_KONIEC, %ebx
	mov bufor, %eax
	cmp %ebx, %eax
		jg naekran

	mov $0x20, %ah
	sub %ah, bufor

	jmp naekran

ending:

	mov $SYSEXIT, %eax
	mov $EXIT_SUCCESS, %ebx

	int $0x80
