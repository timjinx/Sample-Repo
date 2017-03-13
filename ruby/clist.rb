require 'optparse'
class Coin
  attr_reader :face, :value
  @@FaceRange = [0, 1]
  @@ValidValues = [1, 2, 5, 10, 20, 50, 100, 200]
  @@prng = Random.new # Pseudo-random Number Generator
  # Default Face to an illegal value so that it will flip the coin
  def initialize (value=10, face=-1) # CONSTRUCTOR
    self.value = value
    self.face = face
  end
  def face= (new_face)        # Set a valid face
    @face ||= 0 # default
    if @@FaceRange.include? new_face
      @face = new_face
    else
      self.flip
    end
  end
  def value= (new_value)      # Set a valid value
    @value ||= 1 # default
    @value = new_value if @@ValidValues.include? new_value
  end
  def set_face (new_face)     # Set face to a chosen value
     @face = new_face if [0, 1].include? new_face
  end
  def turn                    # Turn the coin over
     @face = (@face + 1).modulo(2)
  end
  def flip                    # Flip the coin
    @face = @@prng.rand(0..1)
  end
  def to_s # Over-ride the to_s method inherited from the Object class
    "Value is #{@value} Face is #{@face}"
  end
end

class CList
  attr_reader :size
  def initialize (size=10)
    @size = size
    @coins = []
    (1..size).each do |i| 
      @coins.push(Coin.new)
    end
  end
  def flip
    @coins.each do |coin|
      coin.flip
    end
  end
  def countheads
    heads = 0
    @coins.each do |coin|
      heads += 1 if coin.face == 1
    end
    heads
  end
  def to_s
    @coins.each do |coin|
      puts coin
    end
    "Total #{@coins.length}"
  end
end

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: clist.rb [options]"

  opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
    options[:verbose] = v
  end
  opts.on("-c", "--coins [CCOUNT]", "Number of coins to flip") do |c|
    options[:count] = c.to_i
  end
  opts.on("-f", "--flips [FCOUNT]", "Number of flips") do |f|
    options[:flips] = f.to_i
  end
end.parse!

unless options[:count]
  abort("No coins specified")
end
unless options[:flips]
  abort("No number of times to flip specified")
end

ccount = options[:count] # Number of coins
fcount = options[:flips] # Number of flips

puts "Flipping a row of #{ccount} coins #{fcount} times"

my_list = CList.new(ccount)
hoccurs = Array.new(ccount)
(0..hoccurs.length).each { |i| hoccurs[i] = 0 } # Zero Array
(1..fcount).each do 
  my_list.flip
  hoccurs[my_list.countheads] += 1
end

(0..hoccurs.length-1).each do |i|
  times="times"
  times="time" if hoccurs[i] == 1
  puts "Flipped #{i} heads #{hoccurs[i]} #{times}" if hoccurs[i] > 0
end
