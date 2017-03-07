program file_handler
   implicit none
   INTEGER :: i, n
   INTEGER :: d = 0  !! Duration - Number of years
   REAL*8 :: a = 0 !! Amount borrowed
   REAL*8 :: r = 0 !! Interest Rate
   REAL*8 :: top_line , bottom_line, ap, mp
   CHARACTER(len=25) :: arg, c_a, c_r, c_d
   n = IARGC ( )
   do i=1,n 
      call GETARG(i,arg)
      if ( i < n ) then
         if ( arg .eq. "-a" ) then
            call GETARG(i + 1, c_a)
            write (*,*) "The amount borrowed is ", trim(c_a), " (currency)"
            read(c_a,*) a
         end if
         if ( arg .eq. "-r" ) then
            call GETARG(i + 1, c_r)
            write (*,*) "The interest rate is ", trim(c_r), "%"
            read(c_r,*) r
         end if
         if ( arg .eq. "-d" ) then
            call GETARG(i + 1, c_d)
            write (*,*) "The loan duration is ", trim(c_d), " years"
            read(c_d,*) d
         end if
      end if
   end do
   if ( a == 0 ) then
      write (*,*) "Please enter an amount using the -a parameter"
      call exit(-1)
   end if
   if ( r == 0 ) then
      write (*,*) "Please enter an interest rate using the -r parameter"
      call exit(-1)
   end if
   if ( d == 0 ) then
      write (*,*) "Please enter duration using the -d parameter"
      call exit(-1)
   end if
   top_line = ( a * r * ( 1 + ( r / 100 ))**d )
   bottom_line = 100 * (( (1 + ( r / 100 ))**d) -1)
   ap = top_line / bottom_line 
   ! ap = nint(ap * 100.0) * 1E-2
   mp = ap / 12 
   write (*,*) "Annual replayments will be ", INT(ap)
   write (*,*) "Monthly replayments will be ", INT(mp)
   write (*,*) "Total cost of loan is ", INT( ap * d ) 
end program file_handler
