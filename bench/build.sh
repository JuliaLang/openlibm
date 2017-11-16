#!/bin/bash

set -e
set -x

FFLAGS="-Wall -Wextra -Wimplicit-interface -fPIC -g -fcheck=all -fbacktrace"
FFLAGS="-Wall -Wextra -Wimplicit-interface -fPIC -O3 -march=native -ffast-math -funroll-loops"

CFLAGS="-fno-gnu89-inline -fno-builtin -fPIC -m64 -std=c99 -Wall -O3"
gcc -flto $CFLAGS -Wno-implicit-function-declaration -c redux.c -o redux.o

#CFLAGS="$CFLAGS -march=native -ffast-math -funroll-loops"

gcc -flto $CFLAGS -I../include -DASSEMBLER -D__BSD_VISIBLE -Wno-implicit-function-declaration -c ../src/s_exp2.c -o s_exp2.c.o
gfortran -flto $FFLAGS -c test_exp2.f90 -o test_exp2.o
gfortran -flto $FFLAGS s_exp2.c.o test_exp2.o redux.o -o test_exp2

./test_exp2
