#include "cudaerror.h"

program fuda
  use fudaDevice
  implicit none
  integer :: count,ierr
  character(len=80) :: error
  print*,"Fuda test"
  call fudaGetDeviceCount(count,ierr)
  if (ierr.ne.CUDA_SUCCESS) then
    call fudaGetErrorString(error,ierr)
    print*,error
  end if
end program fuda
