class Point
  include Enumerable
  include Comparable

  #@@n = 0
  #@@totalX =0
  #@@totalY = 0
  @n = 0
  @totalX = 0
  @totalY = 0

  #attr_reader :x, :y
  #attr_writer :x, :y
  #attr_accessor :x, :y

  #def Point.sum(*points)
  #  x = y = 0
  #  points.each {|p| x += p.x; y += p.y }
  #  Point.new(x, y)
  #end
  #def self.sum(*points)
  #  x = y = 0
  #  points.each {|p| x += p.x; y += p.y }
  #  Point.new(x, y)
  #end
  class << Point    # or class << self
    attr_accessor :n, :totalX, :totalY

    def new(x, y)
      @n = 0 if @n.nil?
      @totalX = 0 if @totalX.nil?
      @totalY = 0 if @totalY.nil?
      @n += 1
      @totalX += x
      @totalY += y
      super
    end

    def sum(*points)
      x = y = 0
      points.each {|p| x += p.x; y += p.y }
      Point.new(x, y)
    end

    def report
      puts "Количество созданных точек: #@n"
      puts "Средняя X координата: #{@totalX.to_f/@n}"
      puts "Средняя координата: #{@totalY.to_f/@n}"
      #puts "Количество созданных точек: #@@n"
      #puts "Средняя X координата: #{@@totalX.to_f/@@n}"
      #puts "Средняя координата: #{@@totalY.to_f/@@n}"
    end
  end

  def initialize(x, y)
    @x, @y = x, y

    #@@n += 1
    #@@totalX += x
    #@@totalY += y
  end

  ORIGIN = Point.new(0, 0)
  UNIT_X = Point.new(1, 0)
  UNIT_Y = Point.new(0, 1)

  def to_s
    "(#@x, #@y)"
  end

  def x; @x; end

  def y; @y; end

  def x=(value); @x = value; end

  def y=(value); @y = value; end

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
  def +(other)
    raise TypeError, "Ожидался аргумент класса Point" unless other.is_a? Point

    Point.new(@x + other.x, @y + other.y)
  end

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

  def ==(other)
    if other.is_a? Point
      @x == other.x && @y == other.y
    else
      false
    end
  end

  #def ==(other)
  #  @x == other.x && @y == other.y
  #rescue
  #  false
  #end

  def eql?(other)
    if other.instance_of? Point
      @x.eql?(other.x) && @y.eql?(other.y)
    else
      false
    end
  end

  def hash
    code = 17
    code = 37 * code + @x.hash
    code = 37 * code + @y.hash
    code
  end

  def <=>(other)
    return nil unless other.instance_of? Point

    @x ** 2 + @y ** 2 <=> other.x ** 2 + other.y ** 2
  end

  def add!(p)
    @x += p.x
    @y += p.y
    self
  end

  def add(p)
    q = self.dup
    q.add!(p)
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

  puts "p == q is #{p == q}, p == p is #{p == p}"

  p = Point.new(1, 2)
  q = Point.new(1.0, 2.0)
  puts "p is #{p}, q is #{q}, p.eql? q is #{p.eql? q}, p == q is #{p == q}"
  puts "hash of p is #{p.hash}"

  p, q = Point.new(1, 0), Point.new(0, 1)
  puts "p == q is #{p == q}, p < q is #{p < q}, p > q is #{p > q}"
  puts "p != q is #{p != q}, p <= q is #{p <= q}, p >= q is #{p >= q}"

  puts "p.add q is #{p.add q}, p.add! q is #{p.add! q}"

  total = Point.sum(p, q, r)
  puts total

  puts Point::ORIGIN, Point::UNIT_X, Point::UNIT_Y

  Point.report

  puts Point.n, Point.totalX, Point.totalY

end
