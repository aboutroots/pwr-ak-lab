SYSEXIT		    = 1
SYSREAD	    	= 3
SYSWRITE     	= 4
STDOUT	     	= 1
STDIN	       	= 0
EXIT_SUCCESS	= 0



.align 32
.bss
  .comm liczba1, 4 # 4 bajty na int
  .comm liczba2, 4
  .comm wynik, 4

.text
  printf_string: .ascii "\nLMAO\n\0"
.data
  format_d: .asciz "%d",  # do scanfa i printfa
  newline: .asciz "\n"


.global main
main:
  # wczytanie od użytkownika inta za pomoca scanf(&liczba1,'%d');
  mov $0, %eax # nie ma zadnych argumentow typu float
  mov $format_d, %edi # pierwszy argument - znacznik int
  mov $liczba1, %esi # drugi argument - adres bufora
  call scanf

  # wczytanie od użytkownika inta za pomoca scanf(&liczba1,'%d');
  mov $0, %eax # nie ma zadnych argumentow typu float
  mov $format_d, %edi # pierwszy argument - znacznik int
  mov $liczba2, %esi # drugi argument - adres bufora
  call scanf

  # skorzystanie z mojej funkcji power
  mov $0, %eax
  mov liczba1, %edi
  mov liczba2, %esi
  call power

  # wyswietlanie printfem
  mov %eax, %esi # musze najpierw, bo zaraz wpisuje tu zero
  mov $0, %eax
  mov $format_d, %edi
  call printf

  # wyswietlenie nowej linii
  mov $0, %eax #
  mov $newline, %edi
  xor %esi, %esi
  call printf

  # Zwrot wartości EXIT_SUCCESS

  mov $0, %eax # Brak parametrów zmiennoprzecinkowych
  call exit
