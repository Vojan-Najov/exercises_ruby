#!/usr/bin/env ruby -w

class FibonacciGenerator
  def initialize
    @x, @y = 0, 1
    @fiber = Fiber.new do
      loop do
        @x, @y = @y, @x + @y
        Fiber.yield @x
      end
    end
  end

  def next
    @fiber.resume
  end

  def rewind
    @x, @y = 0, 1
  end

end

g = FibonacciGenerator.new
10.times { print g.next, " " }
g.rewind
puts
15.times { print g.next, " " }
puts

