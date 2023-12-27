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



def max(first, *rest)
  max = first
  rest.each {|x| max = x if x > max }
  max
end

data = [3, 2, 1]
print max(1), " ", max(1, 2), " ", max(1,3,2), " ", max(*data),  "\n"
puts max(*"hello world".each_char)



def sequence(args)
  n = args[:n] || 0
  m = args[:m] || 1
  c = args[:c] || 0
  a = []
  n.times {|i| a << m * i + c }
  a
end

print sequence({:n=>3, :m=>5}), "\n"
print (sequence c: 1, m: 3, n: 5), "\n"



def sequence2(n, m, c)
  i = 0
  while (i < n)
    yield i * m + c
    i += 1
  end
end

sequence2(5, 2, 2) {|x| print x, " " }; puts



def sequence3(n, m, c, &b)
  i = 0
  while (i < n)
    b.call(i * m + c)
    i += 1
  end
end

sequence3(5, 2, 2) {|x| print x, " "}; puts



def sequence4(args, &b)
  n, m , c = args[:n] || 0, args[:m] || 1, args[:c] || 0
  i = 0
  while (i < n)
    b.call(i * m + c)
    i += 1
  end
end

sequence4(n: 5, m: 2, c: 2) {|x| print x, " "}; puts
