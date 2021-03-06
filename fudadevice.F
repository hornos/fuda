! fudadevice.c wrapper

module fudadevice
  use iso_c_binding

  include "cudadevice.h"

  interface
!   void fudaChooseDevice( int *device, const struct cudaDeviceProp *prop, int *ierr )
    subroutine fudaChooseDevice(device,prop,ierr)
      use iso_c_binding
      import cudaDeviceProp
      integer(c_int) :: device,ierr
      type(cudaDeviceProp)   :: prop
    end subroutine

!   void fudaGetDevice( int *device, int *ierr )
    subroutine fudaGetDevice(device,ierr)
      use iso_c_binding
      integer(c_int) :: device,ierr
    end subroutine

!   void fudaGetDeviceCount( int *count, int *ierr )
    subroutine fudaGetDeviceCount(count,ierr)
      use iso_c_binding
      integer(c_int) :: count,ierr
    end subroutine

!   void fudaGetDeviceProperties( struct cudaDeviceProp *prop, int *device, int *ierr )
    subroutine fudaGetDeviceProperties(prop,device,ierr)
      use iso_c_binding
      import cudaDeviceProp
      integer(c_int) :: device,ierr
      type(cudaDeviceProp)   :: prop
    end subroutine

!   void fudaSetDevice( int *device, int *ierr )
    subroutine fudaSetDevice(device,ierr)
      use iso_c_binding
      integer(c_int) :: device,ierr
    end subroutine

!   void fudaSetDeviceFlags( unsigned int *ags, int *ierr )
    subroutine fudaSetDeviceFlags(ags,ierr)
      use iso_c_binding
      integer(c_int) :: ags,ierr
    end subroutine

!   void fudasetvaliddevices_( int *device_arr, int *len, int *ierr )
    subroutine fudaSetValidDevices(device_arr,len,ierr)
      use iso_c_binding
      integer(c_int), dimension(*) :: device_arr
      integer(c_int) :: len,ierr
    end subroutine

  end interface

end module fudadevice
