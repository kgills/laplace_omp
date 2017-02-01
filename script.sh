#!/bin/bash
#SBATCH -N 1
#SBATCH -p RM
#SBATCH --ntasks-per-node 28
#SBATCH -t 01:20:00
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=kgills@gmail.com
# ./laplace.out

ITERS=$(seq 1 10)
CORES="28"
FILE_NAME="static_pgcc_2048"

for CORE in ${CORES}
do

	export OMP_NUM_THREADS=${CORE}
	touch "${FILE_NAME}_${CORE}.txt"
	echo "iterations, matrix_dim, etime, flops">>"${FILE_NAME}_${CORE}.txt"

	for ITER in ${ITERS}
	do
		./laplace.out>>"${FILE_NAME}_${CORE}.txt"
	done
done
