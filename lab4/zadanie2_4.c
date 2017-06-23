#include "stdio.h"
#include <unistd.h>
long long int get_counter();
long long int get_counter2();

int main(){
long long  int wynik;
long long int licznik;
int wynik_write;

    printf("\n------------------");
    printf("\nwyniki printf:\n");
    for(int i = 0; i<10; i++) {
      licznik = get_counter();
      printf(" \n");
      wynik = get_counter() - licznik;
      printf("%lld \n", wynik);
    }

    printf("\n------------------");
    printf("\nwyniki write:\n");
    for(int i = 0; i<10; i++) {
      licznik = get_counter();
      wynik_write = write(1, " \n", 2);
      wynik = get_counter() - licznik;
      printf("%lld \n", wynik);
    }

    printf("\n------------------");
    printf("\nwyniki pojedynczej operacji na pamieci:\n");
    for(int i = 0; i<10; i++) {
      wynik = get_counter2();
      printf("%lld \n", wynik);
    }

  return 0;
}
