#ifdef __GFORTRAN__
#define KIND_INT_PTR 8
#else
#define KIND_INT_PTR int_ptr_kind()
#endif

#define KIND_INT 4


module fudadevice
  implicit none

#include "cudadevice.h"

  interface
!   void fudachoosedevice_( int *device, const struct cudaDeviceProp *prop, int *ierr )
    subroutine fudaChooseDevice(device,prop,ierr)
      import cudaDeviceProp
      integer,intent(out) :: device,ierr
      type(cudaDeviceProp),intent(in) :: prop
    end subroutine

!   void fudagetdevice_( int *device, int *ierr )
    subroutine fudaGetDevice(device,ierr)
      integer,intent(out) :: device,ierr
    end subroutine

!   void fudagetdevicecount_( int *count, int *ierr )
    subroutine fudagetdevicecount(count,ierr)
      integer,intent(out) :: count,ierr
    end subroutine

!   void fudagetdeviceproperties_( struct cudaDeviceProp *prop, int *device, int *ierr )
    subroutine fudaGetDeviceProperties(device,prop,ierr)
      import cudaDeviceProp
      integer,intent(in)  :: device
      integer,intent(out) :: ierr
      type(cudaDeviceProp),intent(out) :: prop
    end subroutine

!   void fudasetdevice_( int *device, int *ierr )
    subroutine fudaSetDevice(device,ierr)
      integer,intent(in)  :: device
      integer,intent(out) :: ierr
    end subroutine

!   void fudasetdeviceflags_( int *ags, int *ierr )
    subroutine fudaSetDeviceFlags(ags,ierr)
      integer,intent(in)  :: ags
      integer,intent(out) :: ierr
    end subroutine

!   void fudasetvaliddevices_( int *device_arr, int *len, int *ierr )
    subroutine fudaSetValidDevices(device_arr,len,ierr)
      integer,dimension(:),intent(in) :: device_arr, len
      integer,intent(out) :: ierr
    end subroutine

  end interface
end module fudadevice
