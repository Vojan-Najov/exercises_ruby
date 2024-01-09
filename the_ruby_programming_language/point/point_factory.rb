class Point

  def initialize(x, y)
    @x, @y = x, y
  end

  private_class_method :new

  class << self
    def cartesian(x, y)
      new(x, y)
    end

    def polar(r, theta)
      new(r * Math.cos(theta), r * Math.sin(theta))
    end
  end

  def to_s
    "(#@x, #@y)"
  end

end

if __FILE__ == $0

  p1 = Point.cartesian(1, 2)
  p2 = Point.polar(1, 0.5)

  puts p1, p2

end
