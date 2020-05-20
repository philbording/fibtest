            program funfib
!
!
!       fun code to test python calling fortran
!
!       Ralph Phillip Bording
!       May 2020
!       Copyright
!
        integer*16  ifib(1000)
!
        read(5,*)  Nfibterms

        call fib(ifib,Nfibterms)

        do i=1,Nfibterms

         write(6,200) i,ifib(i)

        enddo
 200    format(i20,i80)

        end

        subroutine fib(ifib,Nfibterms)
         
        integer*16  ifib(1000)

c
c      python directives for calling sequence variables 
c
cf2py   intent(in) Nfibterms
cf2py   intent(out) ifib
c
c      end of python directives  
c

        if( Nfibterms .le. 0 ) return
        ifib(1) = 0
        if( Nfibterms .eq. 1 ) return
        ifib(2) = 1
        if( Nfibterms .eq. 2 ) return

        do i=3,Nfibterms

         ifib(i) = ifib(i-1) + ifib(i-2)

        enddo
        return
        end

