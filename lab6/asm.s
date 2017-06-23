.data
.align 16
  wynik: .float 0,0,0,0
  jeden: .float 1,1,1,1
  zero: .float 0,0,0,0

.text
.global calka
.type calka, @function


calka:
push %edi

  mov $0, %edi # licznik petli
  movups tabSTARTX, %xmm0 # xmm0: x
  movups zero, %xmm4      # xmm4: wynik = 0
  movups jeden, %xmm5     # xmm2: 1
  movups tabDX, %xmm6     # xmm3: dx

  petla:
  cmp %edi, ilosc
    je return

  movups %xmm0, %xmm1     # xmm1: x
  mulps %xmm1, %xmm1      # xmm1: x*x
  movups %xmm5, %xmm2     # xmm2: 1
  subps %xmm1, %xmm2      # xmm2: 1- x*x
  movups %xmm0, %xmm3     # xmm3: x
  divps %xmm3, %xmm2      # xmm2:( 1- x*x )/x
  addps %xmm2, %xmm4      # xmm4: WYNIK += xmm2

  addps %xmm6, %xmm0      # dodaję 4 * dx do x'a
  addps %xmm6, %xmm0
  addps %xmm6, %xmm0
  addps %xmm6, %xmm0

  add $4, %edi            # dodaję 4 do licznika pętli
  jmp petla

  return:
  mulps %xmm6, %xmm4      # xmm2:( Wynik )* dx, korzystajac z tego ze dx*a + dx*b = dx(a+b)
  movups %xmm4, wynik
  emms
  FLDs wynik
  FADDs wynik+4
  FADDs wynik+8
  FADDs wynik+12  # zwracanie wartosci poprzez zachowanie jej w %st

pop %edi
ret
