#Struct.new("Point", :x, :y)    # Creates new class Struct::Point

Point = Struct.new(:x, :y)     # Creates new class, assigns to Point

class Point
  include Comparable

  def add!(other)
    self.x += other.x
    self.y += other.y
    self
  end

  def <=>(other)
    return nil unless other.instance_of? Point
    self.x ** 2 + self.y ** 2 <=> other.x ** 2 + other.y ** 2
  end
end

#Point = Struct.new(:x, :y)
#class Point
#  undef x=, y=, []=
#end

p = Point.new(1, 2)

puts "p.x is #{p.x}, p.y is #{p.y}"

p.x = 3
puts "p.x is #{p.x}, p.y is #{p.y}"

p[:x] = 4
puts "p.x is #{p[:x]}, p.y is #{p[1]}"

p.each {|c| print c}; puts
p.each_pair {|n, c| print n, c }; puts

q = Point.new(4, 2)
puts "p == q is #{p == q}"

h = {q => 1}
puts h[p]

puts q.to_s
