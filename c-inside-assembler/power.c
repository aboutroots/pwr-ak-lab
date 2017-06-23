

int power(int x, int multiplier){

  int base = x;
  if (multiplier == 0) return 1;

  for (int i = 1; i<multiplier; i++) x *= base;

  return x;
}
