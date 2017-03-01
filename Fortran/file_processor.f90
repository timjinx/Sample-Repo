program file_handler
   INTEGER :: u, Reason, a, total, count, i, n, iostat
   LOGICAL :: file_exist, verbose, param_found
   REAL*8 :: average
   CHARACTER(len=255) :: arg
   CHARACTER(len=255) :: file_name
   n = IARGC ( )
   param_found = .FALSE.
   verbose = .FALSE.
   do i=1,n 
      call GETARG(i,arg)
      if ( arg .eq. "-v" ) then
         write(*,*) 'Verbose mode'
         verbose = .TRUE.
      end if
	  if ( i < n ) then
         if ( arg .eq. "-f" ) then
            call GETARG(i + 1,file_name)
            param_found = .TRUE.
         end if
      end if
   end do
   if ( .NOT. param_found ) then
      write (*,*) 'please specify file name'
      call exit(-1)
   end if
   inquire(file=file_name, exist=file_exist)
   if (file_exist) then
      if (verbose) then
         write (*,*) 'File found'
      end if
   else 
      write (*,*) 'File not found'
      call exit(-1)
   end if
   open (newunit = u, file = file_name, iostat=iostat)
   if (iostat /= 0) then
      write (*,*) 'Unable to open file ', file_name
      call exit(-1)
   end if
   total = 0
   count = 0
   file_loop: do
     read (u,*,iostat=Reason) a
     if (Reason < 0 ) then
        exit file_loop
     end if
     if (verbose) then
        write(*,*) a
     end if
     total = total + a
     count = count + 1
   end do file_loop
   close (u)
   average = real(total) / count
   write (*,*) 'The total is ', total
   write (*,*) 'The average is ', average
end program file_handler
