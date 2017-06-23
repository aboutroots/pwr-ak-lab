.data
  .comm control, 2
  .comm status, 2
  .comm doublebufor, 8
  .comm singlebufor, 4
  A: .float 1
  B: .float 10
  C: .float 0
  jeden: .int '1'
  zero: .int '0'

.text
  .global odczytStatus
  .global odczytControl
  .global PrecyzjaSingle
  .global PrecyzjaDouble
  .global ZaokraglanieMInf
  .global ZaokraglanieInf
  .global showExample
  .global e1
  .global e2

  .type e1, @function
  .type e2, @function
  .type showExample, @function
  .type odczytStatus, @function
  .type odczytControl, @function
  .type PrecyzjaSingle, @function
  .type PrecyzjaDouble, @function
  .type ZaokraglanieInf, @function
  .type ZaokraglanieMInf, @function

showExample:
push %edi
push %ebx
 mov 12(%esp), %edi
 xor %eax, %eax
 FLD A
 FDIV B
 cmp $32, %edi
  je SINGLE

 FSTl doublebufor
 jmp WYS

 SINGLE:
 FSTs 4+doublebufor # +4 ze wzgledu na konwencje little endian. s-> precyzuje wykladnik

 WYS:
# wyswietlanie całej liczby
   mov $63, %edi
  petla:
    cmp $-1,%edi
      je powrot
    bt %edi, doublebufor
      jc jedynka

    xor %ecx, %ecx
    mov $zero, %ecx # 0
    jmp print
    jedynka:
        mov $jeden, %ecx # 1
    print:
        mov $4, %eax
        mov $1, %ebx
        mov $4, %edx
        int $0x80

    dec %edi
  jmp petla
# -------------------------
powrot:
  movl $doublebufor, %edx
  movl (%edx), %eax
  movl 4(%edx), %edx
  pop %ebx
  pop %edi
ret

odczytStatus:
  xor %eax, %eax
  FSTSW %ax
ret

odczytControl:
  xor %eax, %eax
  FSTCW control
  mov control, %eax
ret


PrecyzjaSingle:
  xor %eax, %eax
  FSTCW control
  mov control, %eax
  and  $0xFcFF, %eax # 1111110011111111 , wyzerowane na pozycjach 9 i 8
  mov  %ax, control
  FLDCW control # zapis do rejestru control
ret

PrecyzjaDouble:
  FSTCW control
  mov control, %eax
  and  $0xFCFF, %eax # 1111110011111111
  mov $0x200, %edx    #      1000000000 , 10 na pozycjach 9 i 8

  add %edx, %eax
  mov  %ax, control
  FLDCW control
ret

ZaokraglanieMInf:
  FSTCW control
  mov control, %eax
  and  $0xF3FF, %eax # 1111001111111111 , wyzerowane na pozycjach 10 i 11
  mov $0x400, %edx   #     010000000000
  add %edx, %eax
  mov  %ax, control
  FLDCW control
ret


ZaokraglanieInf:
  FSTCW control
  mov control, %eax
  and  $0xF3FF, %eax # 1111001111111111 , wyzerowane na pozycjach 10 i 11
  mov $0x800, %edx    #    100000000000

  add %edx, %eax
  mov  %ax, control
  FLDCW control      # zapis do rejestru control
ret


e1: # dzielenie przez 0
  xor %eax, %eax
  FSTCW control
  mov control, %eax
  and  $0xFFFB, %eax # 1111111111111011
  mov  %ax, control
  FLDCW control # wylaczenie maski
  FCLEX # czyszcze stare flagi wyjatkow
  FLD A
  FDIV C # wyjatek

  FNSTSW status
  # wyswietlanie statusu
     mov $15, %edi
    petla2:
      cmp $-1,%edi
        je powrot2
      bt %edi, status
        jc jedynka2

      xor %ecx, %ecx
      mov $zero, %ecx # 0
      jmp print2
      jedynka2:
          mov $jeden, %ecx # 1
      print2:
          mov $4, %eax
          mov $1, %ebx
          mov $4, %edx
          int $0x80

      dec %edi
    jmp petla2
  # -------------------------
  powrot2:
ret


e2: # stack underflow
  xor %eax, %eax
  FSTCW control
  mov control, %eax
  and  $0xFFFE, %eax # 1111111111111110 IE (Invalid Operation flag)
  mov  %ax, control
  FLDCW control # wylaczenie maski
  FFREE %st(0)
  FST doublebufor # wyjatek undreflow

  FNSTSW status
  # wyswietlanie statusu
     mov $15, %edi
    petla3:
      cmp $-1,%edi
        je powrot3
      bt %edi, status
        jc jedynka3

      xor %ecx, %ecx
      mov $zero, %ecx # 0
      jmp print3
      jedynka3:
          mov $jeden, %ecx # 1
      print3:
          mov $4, %eax
          mov $1, %ebx
          mov $4, %edx
          int $0x80

      dec %edi
    jmp petla3
  # -------------------------
  powrot3:
ret
