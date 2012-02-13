#include "cudaerror.h"

program fuda_test
  use fudaDevice
  implicit none
  integer :: count,gpp,ierr
  integer :: device
  character(len=80) :: error
  type(cudaDeviceProp) :: prop
  print*,"Fuda test"

  call fudaGetNumCards(gpp,ierr)
  write(*,'("gpp = ",I5)'),gpp

  call fudaGetDeviceCount(count,ierr)
  if (ierr.ne.CUDA_SUCCESS) then
    call fudaGetErrorString(error,ierr)
    print*,error
    stop
  end if

  device = 0
  call fudaGetDeviceProperties(prop,device,ierr)
  if (ierr.ne.CUDA_SUCCESS) then
    call fudaGetErrorString(error,ierr)
    print*,error
    stop
  end if
  print*,prop%name

end program fuda_test
