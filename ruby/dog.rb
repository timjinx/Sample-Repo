# Credit Mike Merin 2018
# https://mikemerin.github.io/Objected-Oriented-Languages/
class Dog

  attr_accessor :name, :breed, :age

  def initialize(name, breed, age)
    @name = name
    @breed = breed
    @age = age
  end

  def info
    puts "#{@name}, the #{@age} year old #{@breed}."
  end

  def birthday
    @age += 1
    puts "Happy birthday #{@name}! You're now #{@age} years old."
  end

  def greet(message)
    puts "#{message} #{@name}!"
  end

end

my_dog = Dog.new("Lily", "Pit Mix", 8)
puts my_dog #=> #<Dog:0x007f8c3d05d630>
puts my_dog.name #=> Lily

my_dog.info #=> Lily, the 8 year old Pit Mix.
my_dog.birthday #=> Happy birthday Lily! You're now 9 years old.
my_dog.greet("Hello") #=> "Hello Lily!"

my_dog.breed = "Pitbull"
my_dog.info #=> Lily, the 9 year old Pitbull.
