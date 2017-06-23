.data
  .align 64
  .comm bufor, 64
.text

  .global check
  .type check, @function
  .global flush
  .type flush, @function
  .global fetch
  .type fetch, @function
  .global getTime
  .type getTime, @function


getTime:
    push %ebx
    push %edi

    xor %eax, %eax
	cpuid
    cpuid
    cpuid
	rdtsc

    pop %edi
    pop %ebx
ret


check:
  push %ebx
  push %edi
  push %esi
    mov  16(%esp), %edi
    cpuid
    cpuid
    cpuid
    rdtscp

    mov %eax, %esi
    mov (%edi), %eax

    rdtscp
    subl %esi, %eax
  pop %esi
  pop %edi
  pop %ebx
ret



flush:
  push %ebx
  push %edi
    mov 12(%esp), %edi
    clflush (%edi)
  pop %edi
  pop %ebx
ret

fetch:
  push %ebx
  push %edi
    mov 12(%esp), %edi
    prefetch (%edi)
  pop %edi
  pop %ebx
ret
