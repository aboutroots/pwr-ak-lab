
//program wypisujacy znaki + 3 ASCII.
#include "stdio.h"
char string[] = "aBcDeFgH";
const int dlugosc = 8; // dlugosc ciagu znakow


int main(void){
  printf("na wejsciu: %s\n", string);

  asm(

    "mov $0, %%rbx \n" //zeruje licznik
    "loop: \n"
      "mov  (%0, %%rbx, 1), %%al \n" // wczytuje pierwsza literke do al
      "add $3, %%al \n" //dodaje + 3 do ascii
      "mov %%al, (%0, %%rbx, 1) \n" // zapisuje z powrotem do al
      "inc %%rbx \n" //licznik petli
      "cmp dlugosc, %%ebx \n"
        "jl loop \n"

      : // nie ma parametrow OUT
      : "r"(&string) //lista parametrow IN - ich aliasy to kolejno %0, %1 itd
      :"%rbx","%rax" // rejestry do uzywania w kodzie assemblerowym
  );

  printf("wynik + 3 ASCII: %s\n", string);

  return 0;
}
