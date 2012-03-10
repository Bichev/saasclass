a = 3**2
b = 4**2
puts Math.sqrt(a+b)

def h (name = "world") #default value
  puts "Hello #{name.capitalize}!" #insert somethng to a string
end

h #без дефалтового была бы ошибка
h("vova")

self.send(:h,"Self Send function")

class Greeter
  attr_accessor :name, :surname
  
  def initialize(name = "World", surname)
    @surname = surname
    @name = name
  end
  def say_hi
    puts "Hi #{@name} #{@surname}"
  end
  def say_bye
    puts "Bye #{@name}, come later"
  end
#  def name #getter
#    @name
#  end
end

g= Greeter.new("Pat", "Patisson")
puts g.name #getter
puts g.surname #getter
g.say_hi ; g.say_bye
g.name="Billy" ; g.surname="Bounce"
g.say_hi ; g.say_bye
#puts Greeter.instance_methods