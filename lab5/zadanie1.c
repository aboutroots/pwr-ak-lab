#include "stdio.h"
#include <unistd.h>


#define BYTE_TO_BINARY(byte)  \
  (byte & 0x80 ? '1' : '0'), \
  (byte & 0x40 ? '1' : '0'), \
  (byte & 0x20 ? '1' : '0'), \
  (byte & 0x10 ? '1' : '0'), \
  (byte & 0x08 ? '1' : '0'), \
  (byte & 0x04 ? '1' : '0'), \
  (byte & 0x02 ? '1' : '0'), \
  (byte & 0x01 ? '1' : '0')

#define FORMAT16 "\n%c%c%c%c %c%c%c%c %c%c%c%c %c%c%c%c\n"

int odczytStatus();
int odczytControl();
void PrecyzjaSingle();
void PrecyzjaDouble();
void ZaokraglanieInf();
void ZaokraglanieMInf();
double showExample();

void printBinary(int x){
  printf(FORMAT16, BYTE_TO_BINARY(x>>8), BYTE_TO_BINARY(x));
}


int main(){

  printf("--Dostep do rejestrow FPU--\n");
  printf("Odczyt rejestru stanu:\n");
  printBinary(odczytStatus());


  printf("\nOdczyt rejestru kontrolnego:\n");
  printBinary(odczytControl());


  printf("\nPrecyzja obliczeń: single 24bit\n");
    PrecyzjaSingle();
    printf("Odczyt rejestru kontrolnego:");
    printBinary(odczytControl());
    printf("Dzielenie 1/10: \n" );
    printf("001111011   10011001100110011001101\n" );
    printf("\ndziesiętnie %lf\n", showExample() );

  printf("\nPrecyzja obliczeń: double 53bit\n");
    PrecyzjaDouble();
    printf("Odczyt rejestru kontrolnego:");
    printBinary(odczytControl());
    printf("Dzielenie 1/10: \n" );
    printf("\ndziesiętnie %lf\n", showExample() );

  printf("\nTryb zaokraglania: do - inf\n");
    ZaokraglanieMInf();
    printf("Odczyt rejestru kontrolnego:");
    printBinary(odczytControl());
    printf("Dzielenie 1/10: \n" );
    printf("\ndziesiętnie %lf\n", showExample() );

  printf("\nTryb zaokraglania: do + inf\n");
    ZaokraglanieInf();
    printf("Odczyt rejestru kontrolnego: ");
    printBinary(odczytControl());
    printf("Dzielenie 1/10: \n" );

    printf("\ndziesiętnie %lf\n", showExample() );



  return 0;
}
