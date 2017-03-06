program file_handler
   ! Global Declarations
   INTEGER :: rcount
   LOGICAL :: verbose
   CHARACTER(len=255) :: file_name, v_array(10,3)

   ! Start of logic
   if ( .NOT. parameters() ) then
      write (*,*) 'please specify file name'
      call exit(-1)
   end if
   rcount = readfile()
   call sort_array(rcount)
   call print_array(rcount)

contains
   LOGICAL function parameters ()
      CHARACTER(len=255) :: arg
      LOGICAL :: param_found
      INTEGER :: i, n
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
      parameters = param_found
   end function parameters

   integer function readfile ()
      INTEGER :: i, u, Reason, iostat
      LOGICAL :: file_exist
      inquire(file=file_name, exist=file_exist)
      if ( .NOT. file_exist) then
         write (*,*) 'File not found'
         call exit(-1)
      end if
      open (newunit = u, file = file_name, iostat=iostat)
      if (iostat /= 0) then
         write (*,*) 'Unable to open file ', file_name
         call exit(-1)
      end if
      i = 0
      file_loop: do
        read (u,*,iostat=Reason) v_array(i,1), v_array(i,2), v_array(i,3)
        if ( .NOT. Reason == 0 ) then
           exit file_loop
        end if
        i = i + 1
      end do file_loop
      close (u)
      readfile = i - 1
   end function readfile

   subroutine print_array(v_rows)
      implicit none
      INTEGER, INTENT(IN) :: v_rows
      INTEGER :: i
      character*1 tab
      tab = char(9)
      do i = 0, v_rows 
         write (*,'(1x,5a)') trim(v_array(i,3)), tab,  trim(v_array(i,1)), ', ', trim(v_array(i,2))
      end do
   end subroutine print_array

   subroutine sort_array(v_rows)
      implicit none
      INTEGER, INTENT(IN) :: v_rows
      INTEGER :: i, j
      LOGICAL :: v_swapped
      REAL :: score_a, score_b
      sort_loop: do 
         v_swapped = .FALSE.
         do i = 0, v_rows - 1
            read( v_array(i,3), '(f2.1)') score_a
            read( v_array(i+1,3), '(f2.1)') score_b
            if ( score_a < score_b ) then
               call swap(i)
               v_swapped = .TRUE.
            end if
            if ( score_a == score_b ) then
               if ( v_array(i,1) .GT. v_array(i+1,1)) then
                  call swap(i)
                  v_swapped = .TRUE.
               end if
            end if
            if ( score_a == score_b .AND. v_array(i,1) .EQ. v_array(i+1,1)) then
               if ( v_array(i,2) .GT. v_array(i+1,2)) then
                  call swap(i)
                  v_swapped = .TRUE.
               end if
            end if
         end do
         if ( v_swapped .eqv. .FALSE. ) then
            exit sort_loop
         end if
      end do sort_loop
   end subroutine sort_array

   subroutine swap(v_row)
      implicit none
      INTEGER, INTENT(IN) :: v_row
      INTEGER :: j
      CHARACTER(len=255) :: t_array(3)
      do j = 1,3
         t_array(j) = v_array(v_row,j)
         v_array(v_row,j) = v_array(v_row+1,j)
         v_array(v_row+1,j) = t_array(j)
      end do
   end subroutine swap
      
end program file_handler
