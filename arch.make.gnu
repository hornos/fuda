CPP = gcc -E -P -C $*.F >$*.f90
FC  = gfortran
CC  = gcc

CUDA_LIB = $(CUDA_HOME)/lib64
CFLAGS   = -DFUDA_DEBUG -I$(CUDA_HOME)/include
FFLAGS   = -ffree-form -g -O0 
