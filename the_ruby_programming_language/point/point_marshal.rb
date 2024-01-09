class Point

  def initialize(*coords)
    @coords = coords
  end

  def marshal_dump
    @coords.pack("w*")
  end

  def marshal_load(s)
    @coords = s.unpack("w*")
  end

  def to_s
    @coords.to_s
  end

end

p1 = Point.new(1, 2, 3, 4)
puts p1
s = p1.marshal_dump
p2 = Point.new(0, 0, 0)
p2.marshal_load(s)
puts p2

puts

p1 = Point.new(1, 2, 3, 4)
puts p1
s = Marshal.dump(p1)
p2 = Marshal.load(s)
puts p2
puts "p1.id = #{p1.object_id}, p2 = #{p2.object_id}"

