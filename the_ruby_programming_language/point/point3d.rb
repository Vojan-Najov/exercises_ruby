require_relative "struct_point.rb"

class Point3D < Point

  def initialize(x, y, z)
    super(x, y)
    @z = z
  end

  def to_s
    "(#{x}, #{y}, #@z)"
  end
end

if __FILE__ == $0

  p2 = Point.new(1, 2)
  p3 = Point3D.new(1, 2, 3)
  print p2.to_s, p2.class, "\n"
  print p3.to_s, p3.class, "\n"

  p3 = Point3D.new(1, 2, 3)
end

