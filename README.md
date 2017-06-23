# Laboratorium z Architektury Komputerów
## Opis programów

### helloworld
hello world z poziomu assemblera.

### assembler-function-inside-c
program używający funkcji napisanej w assemblerze z poziomu języka C (mnożenie integer)

### assembler-inside-c
program używający funkcji napisanej w assemblerze z poziomu języka C, wykorzystujący tzw "wstawkę assemblerową" bezpośrednio w kodzie w C (szyfr cezara)

### case-matters
program zamieniający małe litery na duże, a duże na małe.

### c-inside-assembler
program wykorzystujący funkcję napisaną w C z poziomu assemblera (potęgowanie, podajemy najpierw podstawę, potem wykładnik)

### simple-reading
program wypisujący na ekran znaki wpisane przez użytkownika.

### lab2
Program zamieniajacy male litery na duze, duze na male, cyfry na ich dopelnienia do 9 (np 1 na 8). Jest w stanie przeczytac dowolnej dlugosci plik.
Zawiera skrypt "porownywarka" sluzacy do porownania dwoch plikow binarnych, np pliku wynikowego powstalego z dzialania programu na pliku wsadowym rand1M.in, ktory powinien byc identyczny z plikiem rand1M.out. uzycie: porownywarka <plik1> <plik2>

### lab3
Program wykonujacy sortowanie babelkowe liczb o dlugosci 96 bitow w systemie "uzupelnien do 2", zadanych za pomoca dowolnego pliku binarnego (bajty tego pliku stanowią zbiór danych). Konwencja Little Endian. Program nie jest do końca poprawny - bug jest możliwy do znalezienia za pomoca skryptu "porownywarka" dla duzych plikow testowych. Bug polega na uzyciu instrukcji działających w systemie NB dla działań na U2.

### lab4
#### zadanie1: 
program z poziomu assemblera wykorzystuje funkcje scanf i printf do pobrania i wyswietlenia kolejno: liczby int, znaku i ciagu znakow.
#### zadanie2-4: 
program mierzy czas printf, write, oraz pojedynczej operacji na pamieci. Mierzenie czasu wykonane jest na poziomie assemblera.
#### zadanie3: 
program wykorzystuje w assemblerze zmienną zadeklarowaną w C, oraz odwrotnie, zmienną z assemblera w C.

### lab5
#### zadanie1-4: 
program pokazuje dzialania na FPU. odczytuje rejestr stanu i kontrolny, a następnie przeprowadza operacje dzielenia dwoch liczb zmiennoprzecinkowych w dla dwoch roznych precyzji oraz sposobow zaokraglania. Na koniec wywoluje jeden z 2 wyjatkow: dzielenie przez zero lub stack underflow. Po każdej operacji wyswietlany jest stan rejestru kontrolnego , oraz - dla dzielenia - bity liczby zmiennoprzecinkowej, oraz reprezentacja dziesiętna.
#### zadanie5:
program obrazuje to, ze FPU jest w stnaie wykonac wiecej niz jedna instrukcje jednoczesnie. wykonuje dwie rozne sekwencje tych samych opracji, jednak w pierwszym przypadku operacje te są od siebie zależne, a drugim prawie wcale. Wyświetla wynik całościowego pomiaru czasu, który jest zdecydowanie niższy przy sekwencji operacji niezależnych.

### lab6
Program dwukrotnie liczy całkę od 1 do 2 z ( 1 - x^2 )/x po dx, za pierwszym razem korzystając z mechanizmów dodawania w C, za drugim wykorzystując przetwarzanie w rejestrach XMM z poziomu assemblera. Zwraca czas wykonania obliczeń, który dla XMM jest mniejszy o rząd wielkości.

### lab7
#### zadanie1:
program pokazuje, że pamięć Cache jest zbudowana z linii. Pierwsze 16 elementów (64b - dlugosc linii) jest pobieranych z tablicy bezpośrednio jeden po drugim, co owocuje w najgorszym wypadku 15 cache hitami. następne elementy pobierane są co indeks większy o 16, więc w najgorszym wypadku powinny to byc zawsze cache missy. 
#### zadanie2:
Program pokazuje , ze cala pamiec cache ma jakiś rozmiar. Zakładając, ze rozmiar ten jest mniejszy niż 10MB, wypełnia cache elementami z tablicy o rozmiarze 10MB (w cache zostaną ostatnie elementy), a następnie iterując wstecz, pokazuje, że dopóki nie wykroczymy poza rozmiar cache, liczba missów jest niewielka, a następnie rośnie w znaczący sposób.
#### zadanie3:
Program pokazuje różnicę w czasie sumowania elementów macierzy po wierszach i kolumnach, oraz średni czas operacji na jednym elemencie w zależności od rozmiaru macierzy. Przejście po wierszach jest szybsze, ponieważ korzystamy z linii cache.

