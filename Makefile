CC=pgcc
C_FLAGS=-mp -O3
OUTPUT=laplace.out

all: laplace.c
	$(CC) $(C_FLAGS) $^ -o $(OUTPUT)

clean:
	@rm -f $(OUTPUT)
	@rm -f slurm*
