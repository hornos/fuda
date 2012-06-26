// Source: CUDA Toolkit Reference Manual
// CUDA Error Handling

#include <stdio.h>
#include <string.h>
#include <driver_types.h>

// const char *cudaGetErrorString (cudaError_t error)
// Returns the message string from an error code.
extern const char *cudaGetErrorString (cudaError_t);
void fudageterrorstring_( char *buf, int *ierr ) {
  const char *err=cudaGetErrorString(*ierr);
  strcpy(buf, err);
#ifdef FUDA_DEBUG
  printf("\n%s (%d) ierr   = %d\n", __FILE__, __LINE__, *ierr );
#endif
}

// cudaError_t cudaGetLastError (void)
// Returns the last error from a runtime call.
extern cudaError_t cudaGetLastError ( void );
void fudagetlasterror_( int *ierr ) {
  *ierr = cudaGetLastError();
#ifdef FUDA_DEBUG
  printf("\n%s (%d) ierr   = %d\n", __FILE__, __LINE__, *ierr );
#endif
}

// cudaError_t cudaPeekAtLastError (void)
// Returns the last error from a runtime call.
extern cudaError_t cudaPeekAtLastError (void);
void fudapeekatLasterror_( int *ierr ) {
  *ierr = cudaPeekAtLastError();
#ifdef FUDA_DEBUG
  printf("\n%s (%d) ierr   = %d\n", __FILE__, __LINE__, *ierr );
#endif
}
