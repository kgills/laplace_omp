CC=gcc
C_FLAGS=-fopenmp -Ofast
L_FLAGS=-lm
OUTPUT=laplace.out

all: laplace.c
	$(CC) $(C_FLAGS) $^ -o $(OUTPUT) $(L_FLAGS)

clean:
	@rm -f $(OUTPUT)