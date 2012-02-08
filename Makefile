.SUFFIXES: .F .f90 .c

include arch.make

C_SRC   = fudadevice.c
C_OBJ   = $(C_SRC:.c=.o)
LIB     = fuda.a
LDFLAGS = $(LIB) -L$(CUDA_LIB) -lcudart

F_SRC  = fudadevice.F
F_MOD  = $(F_SRC:.F=.mod)

all: $(LIB) fuda

$(LIB): $(C_OBJ)
	ar vq $(LIB) $(C_OBJ)

fuda: $(F_MOD) fuda.o
	$(FC) -o fuda fuda.o $(LDFLAGS)

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
