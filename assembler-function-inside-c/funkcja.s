.data
  .comm wynik, 4
.text
  # tutaj deklaracje funkcji, do ktorych C moze sie odwolac po zlinkowaniu skompilowanych plikow
  .global funkcja
  .type funkcja, @function

# jest to funkcja mnozaca dwie liczby przez siebie
funkcja:
  # argumenty funkcji sa w rejestrach edi, esi
#  push %rbp
#  mov %rsp, %rbp

    mov %edi, %eax # liczba 1 idzie do eax
    mul %esi # mnoze przez liczbe 2

    # wynik zwracany przez funkcje znajduje sie w EAX, czyli nie musz enic robic juz.

#  mov %rbp, %rsp
#  pop %rbp
ret # Powrót do miejsca wywołania funkcji
