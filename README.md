gcc -S main.c -o main.s
gcc -c main.s -o main.o | gcc main.o -o main.exe | ./main.exe
