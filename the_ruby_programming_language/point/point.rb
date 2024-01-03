class Point
  include Enumerable

  #attr_reader :x, :y
  #attr_writer :x, :y
  #attr_accessor :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def to_s
    "(#@x, #@y)"
  end

  def x; @x; end

  def y; @y; end

  def x=(value); @x = value; end

  def y=(value); @y = value; end

  def +(other)
    raise TypeError, "Ожидался аргумент класса Point" unless other.is_a? Point

    Point.new(@x + other.x, @y + other.y)
  end

  #def +(other)
  #  unless other.respond_to? :x and other.respond_to? :y
  #    raise TypeError, "Ожидался аргумент, похожий на точку"
  #  end

  #  Point.new(@x + other.x, @y + other.y)
  #end

  #def +(other)
  #  Point.new(@x + other.x, @y + other.y)
  #rescue
  #  raise TypeError, "Ожидался аргумент класса Point"
  #end

  def -@
    Point.new(-@x, -@y)
  end

  def *(scalar)
    Point.new(scalar * @x, scalar * @y)
  end

  def coerce(other)
    [self, other]
  end

  def [](index)
    case index
    when 0, -2 then @x
    when 1, -1 then @y
    when :x, "x" then @x
    when :y, "y" then @y
    else nil
    end
  end

  def each
    yield @x
    yield @y
  end

end

if __FILE__ == $0

  p = Point.new(0, 0)
  puts "p is #{p.class}. p.is_a? Point: #{p.is_a? Point}"

  p = Point.new(1,2)
  puts p

  p = Point.new(1, 2)
  q = Point.new(p.x * 2, p.y * 3)
  q.x = 10
  q.y = 13

  r = p + q
  r = r * 3
  r = -r
  r = 2 * r

  p[0] + p[1] + p[-2] + p[-1] + p[:x] + p[:y] + p["x"] + p["y"]

  p.each {|x| print x}; puts
  
  p.all? {|x| x == 0}

end
