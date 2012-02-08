CPP = gcc -E -P -C $*.F >$*.f90
FC  = gfortran
CC  = gcc

CUDA_DIR = $(CUDA_HOME)
CFLAGS   = -DFUDA_DEBUG -I$(CUDA_DIR)/include
FFLAGS   = -ffree-form -g -O0 
