#include "stdio.h"
extern int funkcja(int a, int b); // to oznacza, ze w czasie kompilacji pojawi sie funkcja o tej nazwie
                                  //i ma zostac dolaczona do programu

int main(void){
  int liczba1;
  int liczba2;

  printf("Podaj liczbe 1: ");
  scanf("%d", &liczba1);
  printf("Podaj liczbe 2: ");
  scanf("%d", &liczba2);

  liczba1 = funkcja(liczba1, liczba2);
  printf("wynik: %d\n", liczba1);

  return 0;
}
