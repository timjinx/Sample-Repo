module boxClass
     implicit none
     private
     public :: Box, printBox, setBoxLength, setBoxHeight, setBoxBreadth, destructBox
     ! Using an implicit constructor
     type :: Box
         real, allocatable :: length
         real, allocatable :: breadth
         real, allocatable :: height
         procedure,nopass,non_overridable :: SetHight => setBoxHeight
     end type Box
contains
     subroutine printBox(this)
         type(Box), intent(in) :: this
         real :: volume
         volume = this%length * this%breadth * this%height
         print *, 'This box has a volume of ', volume
     end subroutine printBox
     subroutine setBoxLength(this, newLength)
         type(Box) :: this
         real , intent(in) :: newLength
         this%length = newLength
     end subroutine setBoxLength
     subroutine setBoxHeight(this, newHeight)
         type(Box) :: this
         real , intent(in) :: newHeight
         this%height = newHeight
     end subroutine setBoxHeight
     subroutine setBoxBreadth(this, newBreadth)
         type(Box) :: this
         real , intent(in) :: newBreadth
         this%breadth = newBreadth
     end subroutine setBoxBreadth
     subroutine destructBox(this)
         type(Box) :: this
         write(*,*) 'In Destructor'
         if (ALLOCATED (this % length)) deallocate(this % length)
         if (ALLOCATED (this % breadth)) deallocate(this % breadth)
         if (ALLOCATED (this % height)) deallocate(this % height)
     end subroutine destructBox
end module boxClass

module colourBoxClass 
    use boxClass
    implicit none
    private
    public :: colourBox, printColourBox, setBoxLength, setBoxHeight, setBoxBreadth, destructBox
    type, extends(Box) :: colourBox
        character (len=20), allocatable :: colour
    end type colourBox
contains
    subroutine setColour(this, newColour)
        type(colourBox) :: this
        character (*), intent(in) :: newColour
        this%colour = newColour
    end subroutine setColour
    subroutine printColourBox(this)
        type(colourBox), intent(in) :: this
        real :: volume
        volume = this%box%length * this%box%breadth * this%box%height
        print *, 'This ', this%colour , ' box has a volume of ', volume
    end subroutine printColourBox
end module colourBoxClass

program box_test
     use boxClass
     use colourBoxClass
     implicit none

     type(Box) :: my_box
     type(colourBox) :: my_colour_box

     my_box = Box(2,3,4)
     call printBox(my_box)
     call setBoxLength(my_box, 5.0)
     call printBox(my_box)

     call setBoxBreadth(my_box, 6.0)
     call setBoxHeight(my_box, 7.0)
     call printBox(my_box)
     call destructBox(my_box)

     my_colour_box = colourBox()
     call setColour(my_colour_box,'Red')
     call setBoxHeight(my_colour_box,5)
     !call printColourBox(my_colour_box)

end program box_test
