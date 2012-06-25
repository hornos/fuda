CPP = gcc -E -P -C $*.F >$*.f90
FC  = gfortran
CC  = gcc

# DEFS = -DFUDA_DEBUG
CUDA_LIB = $(CUDA_HOME)/lib64
CFLAGS   = $(DEFS) -I$(CUDA_HOME)/include
FFLAGS   = -ffree-form -g -O0 
