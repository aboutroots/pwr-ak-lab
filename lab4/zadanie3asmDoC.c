#include <stdio.h>

long int zmienna_assembler;

int main(){

  printf("Oto zmienna assemblerowa: %ld\n", zmienna_assembler);
	zmienna_assembler--;

  printf("Po dekrementacji: %ld\n", zmienna_assembler);

return 0;
}
