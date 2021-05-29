#!/bin/bash
#SBATCH -J MultOpenCL
#SBATCH -A cs475-575
#SBATCH -p class
#SBATCH --gres=gpu:1
#SBATCH -o mult.out
#SBATCH -e mult.err
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=rastellv@oregonstate.edu

for t in 8 16 32 64 128 256 512 1024 
do
    for s in 1 4 8 16 32 64 128 256 512 1024 2048 4096 8192 16384 24576
    do
    g++ -DLOCAL_SIZE=$t -DNMB=$s -o mult mult.cpp /usr/local/apps/cuda/10.1/lib64/libOpenCL.so.1.1 -lm -fopenmp
    ./mult
    done
done
