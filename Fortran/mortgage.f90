program file_handler
   implicit none
   INTEGER :: i, n
   INTEGER :: d = 0  !! Duration - Number of years
   INTEGER :: d_m  !! Duration - Number of month
   REAL*8 :: a = 0 !! Amount borrowed
   REAL*8 :: r = 0 !! Interest Rate
   REAL*8 :: r_m  !! Interest Rate (Monthly)
   REAL*8 :: top_line , bottom_line, ap, mp 
   CHARACTER(len=25) :: arg, c_a, c_r, c_d
   CHARACTER(LEN=20) :: FMT
   n = IARGC ( )
   do i=1,n 
      call GETARG(i,arg)
      if ( i < n ) then
         if ( arg .eq. "-a" ) then
            call GETARG(i + 1, c_a)
            write (*,*) "The amount borrowed is £", trim(c_a)
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
   !! Capitalise Monthly
   r_m = r / 12
   d_m = d * 12
   top_line = ( a * r_m * ( 1 + ( r_m / 100 ))**d_m )
   bottom_line = 100 * (( (1 + ( r_m / 100 ))**d_m) -1)
   mp = top_line / bottom_line 
   ap = mp * 12

   FMT = '(" ",A,"£",F10.2)'
   write (*,FMT) "Annual replayments will be ", ap
   write (*,FMT) "Monthly replayments will be ", mp
   write (*,FMT) "Total cost of loan is ", (ap * d) 
end program file_handler
