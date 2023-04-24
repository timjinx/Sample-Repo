class Box
  attr_accessor :length, :width, :height
  def initialize(length, width, height)
    @length = length
    @width = width
    @height = height
  end
  def get_volume
    vol = @length * @width * @height
    vol
  end
  def inspect
    "A box with length #{length}, a width #{width} and a hight #{height}"
  end
end

class ColouredBox < Box
  attr_accessor :length, :width, :height, :colour
  def initialize(length, width, height, colour)
    @length = length
    @width = width
    @height = height
    @colour = colour
  end
  def get_colour
    @colour
  end
  def set_colour(newcolour)
    @colour = newcolour
  end
  def inspect
    "A #{colour} box with length #{length}, a width #{width} and a hight #{height}"
  end
end

mybox = Box.new(3,4,5)
puts "Volume is %i" % mybox.get_volume
puts mybox.inspect

mycolouredbox = ColouredBox.new(4,5,6,'Pink')
puts "Colour is %s" % mycolouredbox.get_colour
puts "Volume is %i" % mycolouredbox.get_volume

mycolouredbox.set_colour('Green')
puts "Colour is %s" % mycolouredbox.get_colour
puts mycolouredbox.inspect
