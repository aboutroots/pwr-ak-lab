SYSEXIT		    = 1
SYSREAD	    	= 3
SYSWRITE     	= 4
STDOUT	     	= 1
STDIN	       	= 0
EXIT_SUCCESS	= 0

ROZMIAR_POROWNYWANY = 4 # bajty
ROZMIAR_W_PAMIECI = 1000000


.bss
  .comm tablica, 1000000 # maksymalna wielkosc
  .comm iloscbajtow, 1 # do wyswietlania

.text
.global _start

_start:

  mov $SYSREAD, %eax
  mov $STDIN, %ebx
  mov $tablica, %ecx
  mov $ROZMIAR_W_PAMIECI, %edx
  int $0x80

  xor %edx, %edx
  # dec %eax # pozbywam sie znaku \n, tlyko jesli ze stdin a nie z pliku!
  mov $12, %ebx # dziele przez dlugosc liczby w bajtach, 96b = 12 B
  divl %ebx

  mov %eax, iloscbajtow # przyda sie przy wyswietlnaiu
  mov %eax, %edi # to bedzie iterator duzej, ilosc bajtow wczytanych
  dec %edi # od zera liczymy

jmp duza_petla

przed_duza:
   dec %edi # zmniejszenie licznika duzej petli
jmp duza_petla
duza_petla:
  mov $0, %eax
  cmp %edi, %eax
    je ending
  xor %esi, %esi
  jmp mala_petla

mala_petla:
  mov %esi, %eax
  mov $ROZMIAR_POROWNYWANY, %ebx # mnoze przez rozmiar rejestru
  mul %ebx
  xor %edx, %edx
  mov $12, %ebx # dziele przez dlugosc liczby w bajtach, 96b = 12 B
  divl %ebx


  cmp %eax, %edi

    je przed_duza

  xor %ecx, %ecx # bede zapisywal tu CF, zeby mi nie uciekla

# TO JEST LITTLE ENDIAN
# -------------- najmlodsza czesc liczby --------------------------------
  mov tablica(,%esi,ROZMIAR_POROWNYWANY), %eax # esi to "index", rozmiar to "scale"
  add $3, %esi # przesuwam licnzik o 3, czyli do najstepnej liczby 96 bitowej
  mov tablica(,%esi,ROZMIAR_POROWNYWANY), %ebx
  sub %ebx, %eax # podnosze flage pozyczki

  adc $0, %ecx # zapisuje CF

# -------------- srodkowa czesc liczby --------------------------------
  sub $2, %esi # wracam z licnzikiem
  mov tablica(,%esi,ROZMIAR_POROWNYWANY), %eax
  add $3, %esi
  mov tablica(,%esi,ROZMIAR_POROWNYWANY), %ebx

  sub %ecx, %eax # odejmuje ewentualna pozyczke
  xor %ecx, %ecx # czyszcze CF

  sub %ebx, %eax
  adc $0, %ecx # zapisuje CF

# -------------- najstarsza czesc liczby --------------------------------
  sub $2, %esi # wracam z licnzikiem
  mov tablica(,%esi,ROZMIAR_POROWNYWANY), %eax
  add $3, %esi
  mov tablica(,%esi,ROZMIAR_POROWNYWANY), %ebx

  sub %ecx, %eax # odejmuje ewentualna pozyczke

  sub %ebx, %eax
    jge zamien

  sub $2 , %esi # licnzik na poczatek kolejnej liczby
  jmp mala_petla

zamien:
  # zamiana pierwszej pary
  mov tablica(,%esi,ROZMIAR_POROWNYWANY), %eax
  sub $3, %esi
  xchg tablica(,%esi,ROZMIAR_POROWNYWANY), %eax
  add $3, %esi
  mov %eax, tablica(,%esi,ROZMIAR_POROWNYWANY)

  # drugiej
  dec %esi
  mov tablica(,%esi,ROZMIAR_POROWNYWANY), %eax
  sub $3, %esi
  xchg tablica(,%esi,ROZMIAR_POROWNYWANY), %eax
  add $3, %esi
  mov %eax, tablica(,%esi,ROZMIAR_POROWNYWANY)

  # trzeciej
  dec %esi
  mov tablica(,%esi,ROZMIAR_POROWNYWANY), %eax
  sub $3, %esi
  xchg tablica(,%esi,ROZMIAR_POROWNYWANY), %eax
  add $3, %esi
  mov %eax, tablica(,%esi,ROZMIAR_POROWNYWANY)

jmp mala_petla


ending:
  mov $SYSWRITE, %eax
  mov $STDOUT, %ebx
  mov $tablica, %ecx
  mov $iloscbajtow, %edx
  int $0x80

  mov $SYSEXIT, %eax
  mov $EXIT_SUCCESS, %ebx
  int $0x80
