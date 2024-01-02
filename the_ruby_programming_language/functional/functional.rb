#!/usr/bin/env ruby -w

module Functional

  def apply(enum)
    enum.map &self
  end

  def reduce(enum)
    enum.inject &self
  end

  alias | apply

  alias <= reduce

end

class Proc; include Functional; end
class Method; include Functional; end

a = [[1,2], [3,4]]
sum = lambda { |x| x.first + x.last}
sums = sum|a
puts "Sums is #{sums.inspect}"

data = [1, 2, 3, 4]
sum = lambda {|x,y| x+y}
total = sum<=data
puts total

a = [1, 10, 21, 31, 41, 51, 61]

mean = a.inject {|x,y| x+y } / a.size
sumOfSquares = a.map{|x| (x-mean)**2 }.inject{|x,y| x+y }
standartDeviation = Math.sqrt(sumOfSquares/(a.size - 1))
puts standartDeviation

sum = lambda {|x,y| x+y }
mean = (sum<=a) / a.size
deviation = lambda {|x| x-mean }
square = lambda {|x| x*x }
standartDeviation = Math.sqrt((sum<=square|(deviation|a))/(a.size - 1))
puts standartDeviation



module Functional

  def compose(f)
    if self.respond_to?(:arity) && self.arity == 1
      lambda {|*args| self[f[*args]] }
    else
      lambda {|*args| self[*f[*args]] }
    end
  end

  alias * compose

end

f = lambda {|x| x*x }
g = lambda {|x| x+1 }
puts (f*g)[2]
puts (g*f)[2]

def polar(x,y)
  [Math.hypot(y, x), Math.atan2(y,x)]
end

def cartesian(magnitude, angle)
  [magnitude * Math.cos(angle), magnitude * Math.sin(angle)]
end

p, c = method(:polar), method(:cartesian)
puts (c*p)[3,4]

standartDeviation = Math.sqrt((sum<=square*deviation|a)/(a.size - 1))
puts standartDeviation



module Functional

  def apply_head(*first)
    lambda {|*rest| self[*first.concat(rest)] }
  end

  def apply_tail(*last)
    lambda {|*rest| self[*rest.concat(last)] }
  end

  alias << apply_head
  alias >> apply_tail

end

class Proc; prepend Functional; end
class Method; prepend Functional; end

product = lambda {|x, y| x * y }
doubler = product.apply_head(2)
puts product.call(2, 3)
puts doubler.call(2)

difference = lambda {|x, y| x - y }
decrement = difference.apply_tail(1)
puts decrement.call(10)

doubler = product >> 2
puts [1,2,3,4].map(&doubler).inspect


module Functional

  def memoize
    cache = {}
    lambda {|*args|
      unless cache.has_key?(args)
        cache[args] = self[*args]
      end
      cache[args]
    }
  end

  alias +@ memoize

end

class Proc; include Functional; end
class Method; include Functional; end

factorial = lambda {|x| return 1 if x == 0; x * factorial[x - 1] }
cached_factorial = +factorial
puts [7, 8, 9].map(&cached_factorial).inspect
