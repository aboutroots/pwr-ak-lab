#include "stdio.h"
long long int get_counter();

int main(){
long long  int wynik;
long long int licznik;



    for(int i = 0; i<10; i++)
    {
      licznik = get_counter();
      printf("");
      wynik = get_counter() - licznik;
      printf("wynik printf: %lld \n", wynik);
    }

    for(int i = 0; i<10; i++)
    {
      licznik = get_counter();
      write(1, "w", 1);
      wynik = get_counter() - licznik;
      printf("ynik write: %lld \n", wynik);
    }

    for(int i = 0; i<10; i++)
    {
      wynik = get_counter2();
      printf("wynik pamiec: %lld \n", wynik);
    }



  return 0;
}
