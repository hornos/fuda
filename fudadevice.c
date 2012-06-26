
// Source: CUDA Toolkit Reference Manual
// CUDA Device Management

#include <stdio.h>
#include <stdlib.h>
#include <driver_types.h>

// NVIDIA INTERFACE

// cudaError_t cudaChooseDevice (int device, const struct cudaDeviceProp *prop)
// Select compute-device which best matches criteria.
extern cudaError_t cudaChooseDevice ( int *, const struct cudaDeviceProp * );
void fudaChooseDevice( int *device, const struct cudaDeviceProp *prop, int *ierr ) {
  *ierr = cudaChooseDevice( device, prop );
#ifdef FUDA_DEBUG
  printf("\n%s (%d) device = %d", __FILE__, __LINE__, *device );
  printf("\n%s (%d) ierr   = %d\n", __FILE__, __LINE__, *ierr );
#endif
}

// cudaError_t cudaGetDevice (int *device)
// Returns which device is currently being used.
extern cudaError_t cudaGetDevice ( int * );
void fudaGetDevice( int *device, int *ierr ) {
  *ierr = cudaGetDevice( device );
#ifdef FUDA_DEBUG
  printf("\n%s (%d) device = %d", __FILE__, __LINE__, *device );
  printf("\n%s (%d) ierr   = %d\n", __FILE__, __LINE__, *ierr );
#endif
}


// cudaError_t cudaGetDeviceCount (int *count)
// Returns the number of compute-capable devices.
extern cudaError_t cudaGetDeviceCount ( int * );
void fudaGetDeviceCount( int *count, int *ierr ) {
  *ierr = cudaGetDeviceCount( count );
#ifdef FUDA_DEBUG
  printf("\n%s (%d) count = %d", __FILE__, __LINE__, *count );
  printf("\n%s (%d) ierr  = %d\n", __FILE__, __LINE__, *ierr );
#endif
}

// cudaError_t cudaGetDeviceProperties (struct cudaDeviceProp *prop, int device)
// Returns information about the compute-device.
extern cudaError_t cudaGetDeviceProperties (struct cudaDeviceProp *, int);
void fudaGetDeviceProperties( struct cudaDeviceProp *prop, int *device, int *ierr ) {
  *ierr = cudaGetDeviceProperties( prop, *device );
#ifdef FUDA_DEBUG
  printf("\n%s (%d) device = %d", __FILE__, __LINE__, *device );
  printf("\n%s (%d) ierr   = %d\n", __FILE__, __LINE__, *ierr );
#endif
}

// cudaError_t cudaSetDevice (int device)
// Set device to be used for GPU executions.
extern cudaError_t cudaSetDevice (int);
void fudaSetDevice( int *device, int *ierr ) {
#ifdef FUDA_DEBUG
  printf("\n%s (%d) device = %d", __FILE__, __LINE__, *device );
#endif
  *ierr = cudaSetDevice( *device );
}


// cudaError_t cudaSetDeviceFlags (unsigned int ags)
// Sets ags to be used for device executions.
extern cudaError_t cudaSetDeviceFlags (unsigned int);
void fudaSetDeviceFlags( unsigned int *ags, int *ierr ) {
#ifdef FUDA_DEBUG
  printf("\n%s (%d) ags = %d", __FILE__, __LINE__, *ags );
#endif
  *ierr = cudaSetDeviceFlags( *ags );
}


// cudaError_t cudaSetValidDevices (int *device_arr, int len)
// Set a list of devices that can be used for CUDA
extern cudaError_t cudaSetValidDevices (int *, int);
void fudaSetValidDevices( int *device_arr, int *len, int *ierr ) {
#ifdef FUDA_DEBUG
  int i;
  printf("\n%s (%d) len = %d", __FILE__, __LINE__, *len );
  printf("\n%s (%d) device_arr =", __FILE__, __LINE__ );
  for( i = 0; i < *len; i++ ) {
    printf( " %d", device_arr[i] );
  }
#endif
  *ierr = cudaSetValidDevices( device_arr, *len );
}
