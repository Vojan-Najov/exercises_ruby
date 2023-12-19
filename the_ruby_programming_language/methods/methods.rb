#!/usr/bin/env ruby -w

def factorial(n)
  raise "incorrect argument" if n < 1
  return 1 if n == 1
  n * factorial(n-1)
end

puts factorial(10)



def polar(x, y)
  return Math.hypot(y, x), Math.atan2(y, x)
end

def cartesian(magnitude, angle)
  [magnitude * Math.cos(angle), magnitude * Math.sin(angle)]
end

distance, theta = polar(1, 1)
puts "#{distance}  #{theta}"
x, y = cartesian(distance, theta)
puts "#{x}  #{y}"



o = "message"
def o.printme
  puts self
end

o.printme



def sum(x, y); x + y; end
puts sum(1, 2)
undef sum

