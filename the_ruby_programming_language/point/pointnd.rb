class Point
  def initialize(*coords)
    @coords = coords
  end

  def to_s
    @coords.to_s
  end

  def [](i)
    @coords[i]
  end
  
  def []=(i, value)
    @coords[i] = value
  end
end

p1 = Point.new(1, 2, 3, 4)
p2 = p1.clone

puts p1
puts p2
p1[0] = 10
p2[1] = 20
puts p1
puts p2

puts

class Point
  def initialize_copy(orig)
    @coords = @coords.dup
  end
end

p1 = Point.new(1, 2, 3, 4)
p2 = p1.clone

puts p1
puts p2
p1[0] = 10
p2[1] = 20
puts p1
puts p2
