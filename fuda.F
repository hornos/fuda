#include "cudaerror.h"

program fuda
  use fudaDevice
  implicit none
  integer :: count,ierr
  print*,"Fuda test"
  call fudaGetDeviceCount(count,ierr)
  if (ierr.ne.CUDA_SUCCESS) then
    print*,"error"
  end if
end program fuda
