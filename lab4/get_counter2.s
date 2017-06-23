.data
  .comm wynik, 4
.text
  .global get_counter2
  .type get_counter2, @function

get_counter2:

    push %ebx

      xor %eax, %eax
      cpuid
      cpuid
      cpuid
      rdtscp  # pierwszy pomiar

      mov %eax, wynik # pojedyncza operacja

      rdtscp # drugi pomiar

      subl wynik, %eax
      xor %edx, %edx

    pop %ebx

ret
