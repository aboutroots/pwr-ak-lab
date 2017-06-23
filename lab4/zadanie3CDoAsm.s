.text

  # instrukcja dla printfa
  format_printf1: .string "Oto zmienna C : %d\n"
  format_printf2: .string "Po dekrementacji: %d\n"

.global main
main:

  # printf("Oto zmienna C : %d\n", zmienna_c);
	push zmienna_c
	push $format_printf1
	call printf
	add $8, %esp

  decl zmienna_c

  # printf("Po dekrementacji: %d\n", zmienna_c);
  push zmienna_c
	push $format_printf2
  call printf
	add $8, %esp

ret
