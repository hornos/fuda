#include "cudaerror.h"

program fuda_test
  use fudaDevice
  implicit none
  integer :: count,ierr,i
  integer :: device
  character(len=80) :: error
  character(len=512) :: fmt_prop
  type(cudaDeviceProp) :: prop
  print*,"Fuda test"

  call fudaGetDeviceCount(count,ierr)
  if (ierr.ne.CUDA_SUCCESS) then
    call fudaGetErrorString(error,ierr)
    print*,error
    stop
  end if

   fmt_prop = "(&
   /' Device properties:'&
   /'  id: ',I3,2X,'name: ',A &
   /'  regsPerBlock: ',I5,2X,'warpSize: ',I5 &
   /'  maxThreadsPerBlock: ',I5,2X,'maxThreadsDim: ',3I5 &
 /)"

!  integer(C_INT)                   :: maxGridSize(3)
!  integer(C_INT)                   :: clockRate
!  integer(C_INT)                   :: major
!  integer(C_INT)                   :: minor
!  integer(C_INT)                   :: deviceOverlap
!  integer(C_INT)                   :: multiProcessorCount
!  integer(C_INT)                   :: kernelExecTimeoutEnabled
!  integer(C_INT)                   :: integrated
!  integer(C_INT)                   :: canMapHostMemory
!  integer(C_INT)                   :: computeMode
!  integer(C_INT)                   :: maxTexture1D
!  integer(C_INT)                   :: maxTexture1DLinear
!  integer(C_INT)                   :: maxTexture2D(2)
!  integer(C_INT)                   :: maxTexture2DLinear(3)
!  integer(C_INT)                   :: maxTexture2DGather(2)
!  integer(C_INT)                   :: maxTexture3D(3)
!  integer(C_INT)                   :: maxTextureCubemap
!  integer(C_INT)                   :: maxTexture1DLayered(2)
!  integer(C_INT)                   :: maxTexture2DLayered(3)
!  integer(C_INT)                   :: maxTextureCubemapLayered(2)
!  integer(C_INT)                   :: maxSurface1D
!  integer(C_INT)                   :: maxSurface2D(2)
!  integer(C_INT)                   :: maxSurface3D(3)
!  integer(C_INT)                   :: maxSurface1DLayered(2)
!  integer(C_INT)                   :: maxSurface2DLayered(3)
!  integer(C_INT)                   :: maxSurfaceCubemap
!  integer(C_INT)                   :: maxSurfaceCubemapLayered(2)
!  integer(C_INT)                   :: concurrentKernels
!  integer(C_INT)                   :: ECCEnabled
!  integer(C_INT)                   :: pciBusID
!  integer(C_INT)                   :: pciDeviceID
!  integer(C_INT)                   :: pciDomainID
!  integer(C_INT)                   :: tccDriver
!  integer(C_INT)                   :: asyncEngineCount
!  integer(C_INT)                   :: unifiedAddressing
!  integer(C_INT)                   :: memoryClockRate
!  integer(C_INT)                   :: memoryBusWidth
!  integer(C_INT)                   :: l2CacheSize
!  integer(C_INT)                   :: maxThreadsPerMultiProcessor


  do device=0,count-1
    call fudaGetDeviceProperties(prop,device,ierr)
    if (ierr.ne.CUDA_SUCCESS) then
      call fudaGetErrorString(error,ierr)
      print*,error
      stop
    end if
!    print '(I3,X,A)',device,prop%name
    print(fmt_prop),device,prop%name,&
                    prop%regsPerBlock,prop%warpSize,&
                    prop%maxThreadsPerBlock,(prop%maxThreadsDim(i),i=1,3)
  end do



end program fuda_test
