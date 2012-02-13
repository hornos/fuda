.SUFFIXES: .F .f90 .c

include arch.make

C_SRC   = fudadevice.c fudaerror.c
C_OBJ   = $(C_SRC:.c=.o)
LIB     = fuda.a
LDFLAGS = $(LIB) -L$(CUDA_LIB) -lcudart

F_SRC  = $(C_SRC:.c=.F)
F_MOD  = $(F_SRC:.F=.mod)

all: $(LIB) fuda_test

$(LIB): $(C_OBJ)
	ar vq $(LIB) $(C_OBJ)

fuda_test: $(F_MOD) fuda_test.o
	$(FC) -o fuda_test fuda_test.o $(LDFLAGS)

.c.o:
	@echo "\nC Object:" $@
	$(CC) -c $(CFLAGS) $< -o $@

.F.o:
	@echo "\nF Object:" $@
	$(CPP)
	$(FC) $(FFLAGS) -c $*.f90 -o $@

.F.mod:
	@echo "\nF Module:" $@
	$(CPP)
	$(FC) $(FFLAGS) -c $*.f90

clean:
	rm -f *.o *.a *.mod *.f90
