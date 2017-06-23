#include <stdio.h>
float        calka();
unsigned int get_counter();

float a  = 1.0;
float b  = 2.0;
float DX = (float)1 / 65536;
float tabDX[4];
float tabSTARTX[4];
int   ilosc;

int main() {
  unsigned int start, end;
  float wynik = 0;
  float x     = a;

  ilosc = 0;

  while (x < b) { // obliczenie ilosci obrotow petli
    ilosc++;
    x += DX;
  }
  x = a;

  // calka 1------------------------------------
  start = get_counter();

  for (int i = 0; i < ilosc; i++) {
    wynik += DX * ((1 - (x * x)) / x);
    x     += DX;
  }
  end = get_counter();
  printf("%.6f, czas %d\n", wynik, end - start);


  // calka 2--------------------------------------
  start = get_counter();

  for (int i = 0; i < 4; i++) tabDX[i] = DX;

  for (int i = 0; i < 4; i++) tabSTARTX[i] = a + DX * i;

  wynik = calka();
  end   = get_counter();
  printf("%.6f, czas %d\n", wynik, end - start);

  return 0;
}
