require 'singleton'

class PointStats
  include Singleton

  def initialize
    @n, @totalX, @totalY = 0, 0.0, 0.0
  end

  def record(point)
    @n += 1
    @totalX += point.x
    @totalY += point.y
  end

  def report
    puts "Количество созданных точек: #@n"
    puts "Усредненная координат X: #{@totalX/@n}"
    puts "Усредненная координат Y: #{@totalY/@n}"
  end
end

class Point
  attr_accessor :x, :y

  def initialize(x, y)
    @x, @y = x, y
    PointStats.instance.record(self)
  end
end


p1 = Point.new(1,2)
p2 = Point.new(12,7)
p3 = Point.new(-11,22)

PointStats.instance.report

