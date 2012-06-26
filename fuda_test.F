#include "cudaerror.h"

program fuda_test
  use fudaDevice
  implicit none
  integer :: count,ierr,i
  integer :: device
  character(len=128) :: error = ''
  character(len=512) :: fmt_prop
  type(cudaDeviceProp) :: prop
  print*,"Fortran Cuda Wrapper"

  call fudaGetDeviceCount(count,ierr)
  if (ierr.ne.CUDA_SUCCESS) then
    call fudaGetErrorString(error,ierr)
    print*,trim(error)
    stop
  end if

   fmt_prop = "(&
   /' Device properties:'&
   /'  id: ',I3,2X,'name: ',A &
   /'  regsPerBlock: ',I5,2X,'warpSize: ',I5 &
   /'  maxThreadsPerBlock: ',I5,2X,'maxThreadsDim: ',3I5 &
   /'  pciBusID: ',I5,2X,'pciDeviceID: ',I5,2X,'pciDomainID: ',I5 &
 /)"

  do device=0,count-1
    call fudaGetDeviceProperties(prop,device,ierr)
    if (ierr.ne.CUDA_SUCCESS) then
      call fudaGetErrorString(error,ierr)
      print*,error
      stop
    end if
    print(fmt_prop),device,prop%name,&
                    prop%regsPerBlock,prop%warpSize,&
                    prop%maxThreadsPerBlock,(prop%maxThreadsDim(i),i=1,3),&
                    prop%pciBusID,prop%pciDeviceID,prop%pciDomainID
  end do

end program fuda_test
