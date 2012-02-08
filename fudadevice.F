module fudadevice
  implicit none

  interface

!   void fudaGetDevice_( int *device, int *ierr )
    subroutine fudaGetDevice(device,ierr)
      integer,intent(out) :: device,ierr
    end subroutine

!   void fudaGetDeviceCount_( int *count, int *ierr )
    subroutine fudagetdevicecount(count,ierr)
      integer,intent(out) :: count,ierr
    end subroutine

!   void fudaSetDevice_( int *device, int *ierr )
    subroutine fudaSetDevice(device,ierr)
      integer,intent(in)  :: device
      integer,intent(out) :: ierr
    end subroutine

!   void fudaSetDeviceFlags_( int *ags, int *ierr )
    subroutine fudaSetDeviceFlags(ags,ierr)
      integer,intent(in)  :: ags
      integer,intent(out) :: ierr
    end subroutine

!   void fudaSetValidDevices_( int *device_arr, int len, int *ierr )
    subroutine fudaSetValidDevices(device_arr,ierr)
      integer,dimension(:),intent(in) :: device_arr
      integer,intent(out) :: ierr
    end subroutine

  end interface
end module fudadevice
