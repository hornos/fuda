#ifdef __GFORTRAN__
#define KIND_INT_PTR 8
#else
#define KIND_INT_PTR int_ptr_kind()
#endif

#define KIND_INT     4
#define KIND_FLOAT   4
#define KIND_DOUBLE  8
