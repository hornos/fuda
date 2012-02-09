#include "fudakind.h"

! TODO: cudaDeviceProp format

module fudadevice
  implicit none

#include "cudadevice.h"

  interface
!   void fudachoosedevice_( int *device, const struct cudaDeviceProp *prop, int *ierr )
    subroutine fudaChooseDevice(device,prop,ierr)
      import cudaDeviceProp
      integer(kind=KIND_INT) :: device,ierr
      type(cudaDeviceProp)   :: prop
    end subroutine

!   void fudagetdevice_( int *device, int *ierr )
    subroutine fudaGetDevice(device,ierr)
      integer(kind=KIND_INT) :: device,ierr
    end subroutine

!   void fudagetdevicecount_( int *count, int *ierr )
    subroutine fudagetdevicecount(count,ierr)
      integer(kind=KIND_INT) :: count,ierr
    end subroutine

!   void fudagetdeviceproperties_( struct cudaDeviceProp *prop, int *device, int *ierr )
    subroutine fudaGetDeviceProperties(device,prop,ierr)
      import cudaDeviceProp
      integer(kind=KIND_INT) :: device
      integer(kind=KIND_INT) :: ierr
      type(cudaDeviceProp)   :: prop
    end subroutine

!   void fudasetdevice_( int *device, int *ierr )
    subroutine fudaSetDevice(device,ierr)
      integer(kind=KIND_INT) :: device
      integer(kind=KIND_INT) :: ierr
    end subroutine

!   void fudasetdeviceflags_( unsigned int *ags, int *ierr )
    subroutine fudaSetDeviceFlags(ags,ierr)
      integer(kind=KIND_INT) :: ags
      integer(kind=KIND_INT) :: ierr
    end subroutine

!   void fudasetvaliddevices_( int *device_arr, int *len, int *ierr )
    subroutine fudaSetValidDevices(device_arr,len,ierr)
      integer(kind=KIND_INT),dimension(:) :: device_arr
      integer(kind=KIND_INT) :: len, ierr
    end subroutine

  end interface
end module fudadevice
