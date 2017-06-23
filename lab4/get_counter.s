
.text
  .global get_counter
  .type get_counter, @function

get_counter:

    push %ebx
      xor %eax, %eax
      cpuid
      rdtsc
    pop %ebx
ret
