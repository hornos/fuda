#include "fudakind.h"

module fudaerror
  implicit none

  interface

!  void fudageterrorstring_( char *buf, int *ierr )
   subroutine fudaGetErrorString(buf,ierr)
     integer(kind=KIND_INT),intent(in) :: ierr
     character(len=*),intent(out) :: buf
   end subroutine

!  void fudagetlasterror_( int *ierr )
  subroutine fudaGetLastError(ierr)
    integer(kind=KIND_INT),intent(out) :: ierr
  end subroutine

!  void fudapeekatlasterror_( int *ierr )
  subroutine fudaPeekAtLastError(ierr)
    integer(kind=KIND_INT),intent(out) :: ierr
  end subroutine

  end interface
end module fudaerror
