
module fudaerror
  implicit none

  interface

!   void fudageterrorstring_( char *buf, int *ierr )
    subroutine fudaGetErrorString(buf,ierr)
      use iso_c_binding
      integer(c_int) :: ierr
      character(*,c_char),intent(out) :: buf
    end subroutine

!   void fudagetlasterror_( int *ierr )
    subroutine fudaGetLastError(ierr) &
               bind(c,name='fudaGetLastError')
      use iso_c_binding
      integer(c_int),intent(out) :: ierr
    end subroutine

!   void fudapeekatlasterror_( int *ierr )
    subroutine fudaPeekAtLastError(ierr) &
               bind(c,name='fudaPeekAtLastError')
      use iso_c_binding
      integer(c_int),intent(out) :: ierr
    end subroutine

  end interface
end module fudaerror
