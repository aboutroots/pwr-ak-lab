.data
  A: .float 1
  B: .float 0
  .comm wynik, 4

.text
  .global sequence1
  .global sequence2

  .type sequence1, @function
  .type sequence2, @function

sequence1:
push %ebx
  FLD B
  FLD B
  FLD B
  FLD B
  FLD B
  FLD B
  FLD B
  FLD A

  xor %eax, %eax
  cpuid
  rdtsc  # pierwszy pomiar
  mov %eax, wynik

  FADD %st, %st(1)
  FADD %st, %st(2)
  FADD %st, %st(3)
  FADD %st, %st(4)
  FADD %st, %st(5)
  FADD %st, %st(6)
  FADD %st, %st(7) # 1

  FADD %st, %st(1)
  FADD %st, %st(2)
  FADD %st, %st(3)
  FADD %st, %st(4)
  FADD %st, %st(5)
  FADD %st, %st(6)
  FADD %st, %st(7) # 2

  FADD %st, %st(1)
  FADD %st, %st(2)
  FADD %st, %st(3)
  FADD %st, %st(4)
  FADD %st, %st(5)
  FADD %st, %st(6)
  FADD %st, %st(7) # 3

  FADD %st, %st(1)
  FADD %st, %st(2)
  FADD %st, %st(3)
  FADD %st, %st(4)
  FADD %st, %st(5)
  FADD %st, %st(6)
  FADD %st, %st(7) # 4

  FADD %st, %st(1)
  FADD %st, %st(2)
  FADD %st, %st(3)
  FADD %st, %st(4)
  FADD %st, %st(5)
  FADD %st, %st(6)
  FADD %st, %st(7) # 5

  FADD %st, %st(1)
  FADD %st, %st(2)
  FADD %st, %st(3)
  FADD %st, %st(4)
  FADD %st, %st(5)
  FADD %st, %st(6)
  FADD %st, %st(7) # 6

  FADD %st, %st(1)
  FADD %st, %st(2)
  FADD %st, %st(3)
  FADD %st, %st(4)
  FADD %st, %st(5)
  FADD %st, %st(6)
  FADD %st, %st(7) # 7

  FADD %st, %st(1)
  FADD %st, %st(2)
  FADD %st, %st(3)
  FADD %st, %st(4)
  FADD %st, %st(5)
  FADD %st, %st(6)
  FADD %st, %st(7) # 8

  FADD %st, %st(1)
  FADD %st, %st(2)
  FADD %st, %st(3)
  FADD %st, %st(4)
  FADD %st, %st(5)
  FADD %st, %st(6)
  FADD %st, %st(7) # 9

  FADD %st, %st(1)
  FADD %st, %st(2)
  FADD %st, %st(3)
  FADD %st, %st(4)
  FADD %st, %st(5)
  FADD %st, %st(6)
  FADD %st, %st(7) # 10

  FADD %st, %st(1)
  FADD %st, %st(2)
  FADD %st, %st(3)
  FADD %st, %st(4)
  FADD %st, %st(5)
  FADD %st, %st(6)
  FADD %st, %st(7) # 11

  FADD %st, %st(1)
  FADD %st, %st(2)
  FADD %st, %st(3)
  FADD %st, %st(4)
  FADD %st, %st(5)
  FADD %st, %st(6)
  FADD %st, %st(7) # 12

  FADD %st, %st(1)
  FADD %st, %st(2)
  FADD %st, %st(3)
  FADD %st, %st(4)
  FADD %st, %st(5)
  FADD %st, %st(6)
  FADD %st, %st(7) # 13

  FADD %st, %st(1)
  FADD %st, %st(2)
  FADD %st, %st(3)
  FADD %st, %st(4)
  FADD %st, %st(5)
  FADD %st, %st(6)
  FADD %st, %st(7) # 14

  FADD %st, %st(1)
  FADD %st, %st(2)
  FADD %st, %st(3)
  FADD %st, %st(4)
  FADD %st, %st(5)
  FADD %st, %st(6)
  FADD %st, %st(7) # 15

  FADD %st, %st(1)
  FADD %st, %st(2)
  FADD %st, %st(3)
  FADD %st, %st(4)
  FADD %st, %st(5)
  FADD %st, %st(6)
  FADD %st, %st(7) # 16

  FADD %st, %st(1)
  FADD %st, %st(2)
  FADD %st, %st(3)
  FADD %st, %st(4)
  FADD %st, %st(5)
  FADD %st, %st(6)
  FADD %st, %st(7) # 17

  FADD %st, %st(1)
  FADD %st, %st(2)
  FADD %st, %st(3)
  FADD %st, %st(4)
  FADD %st, %st(5)
  FADD %st, %st(6)
  FADD %st, %st(7) # 18

  FADD %st, %st(1)
  FADD %st, %st(2)
  FADD %st, %st(3)
  FADD %st, %st(4)
  FADD %st, %st(5)
  FADD %st, %st(6)
  FADD %st, %st(7) # 19

  FADD %st, %st(1)
  FADD %st, %st(2)
  FADD %st, %st(3)
  FADD %st, %st(4)
  FADD %st, %st(5)
  FADD %st, %st(6)
  FADD %st, %st(7) # 20

  rdtsc # drugi pomiar

#  FFREE %st(0)
#  FFREE %st(1)
#  FFREE %st(2)
#  FFREE %st(3)
#  FFREE %st(4)
#  FFREE %st(5)
#  FFREE %st(6)
  FFREE %st(7)

  subl wynik, %eax
  xor %edx, %edx

pop %ebx
ret

sequence2:
push %ebx
  FLD A


  xor %eax, %eax
  cpuid
  rdtsc  # pierwszy pomiar
  mov %eax, wynik

  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st
  FADD %st #140


  rdtsc # drugi pomiar

  FFREE %st(0)

  subl wynik, %eax
  xor %edx, %edx

pop %ebx
ret
