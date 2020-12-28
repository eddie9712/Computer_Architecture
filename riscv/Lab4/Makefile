CC=gcc
LD=gcc
CFLAGS=-ggdb -Wall -pedantic -std=gnu99 -O3
LDFLAGS=

EX2_PROG=matrixMultiply

EX3_PROG=transpose

PROGS=$(EX2_PROG) $(EX3_PROG)

all: $(PROGS)

ex2:
		$(CC) -o $(EX2_PROG) $(CFLAGS) $(EX2_PROG).c
		./$(EX2_PROG)

ex3_part1:
		$(CC) -o $(EX3_PROG) $(CFLAGS) $(EX3_PROG).c
		./$(EX3_PROG) 1
		python3.8 result.py 1
ex3_part2:
		$(CC) -o $(EX3_PROG) $(CFLAGS) $(EX3_PROG).c
		./$(EX3_PROG) 2
		python3.8 result.py 2

clean:
		-rm -rf core *.o *~ "#"*"#" Makefile.bak $(PROGS) *.dSYM

