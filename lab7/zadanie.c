#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>

unsigned int getTime();
unsigned int check(int *x);
void         flush(int *x);
void         fetch(int *x);


void         zad1() {
    int rozmiar = 10000;
    int wyniki[rozmiar];

    for (int i = 0; i < rozmiar; i++) {
        wyniki[i] = 999;
        flush(&wyniki[i]); // w cache nie bedzie zadnego elementu
    }

    for (int i = 0; i < 80; i++) {
        wyniki[i] = check(&wyniki[i]);
    }

    for (int i = 80; i < rozmiar; i += 16) {
        wyniki[i] = check(&wyniki[i]);
    }

    for (int i = 0; i < rozmiar; i++) {
        if (i == 80) printf("\n\n\n");

        if (wyniki[i] != 999) {
            printf("i: %5d , %5d ", i, wyniki[i]);

            for (int j = 0; j < wyniki[i]; j++) printf(".");
            printf("\n");
        }
    }
}

void zad2() {
    int  rozmiar = 2500000; // 2.5M * 4B = 10MB
    int  skok    = 100;
    int *wyniki  = (int *)malloc(rozmiar * sizeof(int));

    // umieszczenie najnowszych elementow tablicy w cache
    for (int j = 0; j < 10; j++) { // 10 razy dla pewności.
        for (int i = 0; i < rozmiar; i++) {
            fetch(&wyniki[i]);
            wyniki[i] = 999;
        }
    }


    int hit[10]     = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
    int miss[10]    = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
    int hitcounter  = 0;
    int misscounter = 0;
    int MBcounter   = 0;

    // zebranie czasow od ostatniego elementu od pierwszego, oraz hit/miss ratio
    for (int i = rozmiar; i >= 0; i -= skok) {
        wyniki[i] = check(&wyniki[i]);

        if (wyniki[i] <= 80) hitcounter++;
        else misscounter++;

        if ((i != rozmiar) && ((i * 4) % 1000000 == 0)) {
            miss[MBcounter] = misscounter;
            hit[MBcounter]  = hitcounter;
            MBcounter++;
            hitcounter  = 0;
            misscounter = 0;
        }
    }

    // wyswietlenie wszystkich czasow
    // for (int i = rozmiar; i >= 0; i -= skok) {
    //     if (wyniki[i] != 999) {
    //         printf("B: %7d , %3d ", i * 4, wyniki[i]);
    //
    //         for (int j = 0; j < wyniki[i] / 2; j++) printf(".");
    //         printf("\n");
    //     }
    // }

    // wyswietlenie hit/miss
        printf("MB liczone od końca tablicy:\n");
        printf("| lp. |  hits  |  misses |\n");
        printf("+-----+-------+--------+\n");

    for (int i = 0; i < 10; i++) {
        printf("|%2dMB | %6d | %6d  |\n", i + 1, hit[i], miss[i]);
    }
}

void usredniony(int rozmiar, int arr[][rozmiar]) {
    // flush
    for (int i = 0; i < rozmiar; i++) {
        for (int j = 0; j < rozmiar; j++) {
            flush(&arr[i][j]);
        }
    }

    // wiersze
    unsigned int suma = 0;

    for (int i = 0; i < rozmiar; i++) {
        for (int j = 0; j < rozmiar; j++) {
            suma += check(&arr[i][j]);
        }
    }
    printf("Rozmiar: %7dB iteracja po wierszach, czas: %f\n",
           rozmiar * rozmiar * 4, (float)suma / (rozmiar*rozmiar));

    // flush
    for (int i = 0; i < rozmiar; i++) {
        for (int j = 0; j < rozmiar; j++) {
            flush(&arr[i][j]);
        }
    }

    // kolumny
    suma = 0;

    for (int i = 0; i < rozmiar; i++) {
        for (int j = 0; j < rozmiar; j++) {
            suma += check(&arr[j][i]);
        }
    }
    printf("Rozmiar: %7dB iteracja po kolumnach, czas: %f\n\n",
           rozmiar * rozmiar * 4, (float)suma / (rozmiar*rozmiar));
}

int matrix[1000][1000];
int matrix2[10][10];
int matrix3[100][100];
int matrix4[250][250];
int rozmiar = 4;
void zad3() {
    // wypełnianie macierzy razem z flushem
    for (int i = 0; i < rozmiar; i++) {
        for (int j = 0; j < rozmiar; j++) {
            matrix[i][j] = 1;
            flush(&matrix[i][j]);
        }
    }

    // sumowanie po wierszach macierzy i calosciowy pomiar czasu
    int suma           = 0;
    unsigned int start = getTime();

    for (int i = 0; i < rozmiar; i++) {
        for (int j = 0; j < rozmiar; j++) {
            suma += matrix[i][j];
        }
    }
    unsigned int end = getTime() - start;
    printf("\nRozmiar: %dB Czas sumowania po wierszach %d\n", suma * 4, end);

    // flush
    for (int i = 0; i < rozmiar; i++) {
        for (int j = 0; j < rozmiar; j++) {
            flush(&matrix[i][j]);
        }
    }

    // sumowanie po kolumnach macierzy i calosciowy pomiar czasu
    suma  = 0;
    start = getTime();

    for (int i = 0; i < rozmiar; i++) {
        for (int j = 0; j < rozmiar; j++) {
            suma += matrix[j][i];
        }
    }
    end = getTime() - start;
    printf("Rozmiar: %dB Czas sumowania po kolumnach %d\n", suma * 4, end);

    // usredniony pomiar czasu pojedynczej instrukcji:
    printf("--------------------------------------------------------\n");
    printf("Usredniony czas jednej instrukcji:\n");

    usredniony(10,   matrix2);
    usredniony(100,  matrix3);
    usredniony(250,  matrix4);
    usredniony(1000, matrix);
}

int main() {
    printf("\n\nzadanie2:\n\n\n");
    zad2();
    printf("\n\nzadanie3:\n\n");
    zad3();
    return 0;
}
