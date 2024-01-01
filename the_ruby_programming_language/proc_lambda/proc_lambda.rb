#!/usr/bin/env ruby -w

def makeproc(&p)
  p
end

adder = makeproc {|x, y| x + y}
puts adder.call(2, 3)



succ1 = lambda {|x| x + 1}
succ2 = ->(x){ x + 1 }

puts succ1.call(3), succ2.call(5)



def compose(f, g)
  ->(x) { f.call(g.call(x)) }
end

succOfSquare = compose(->x{x+1}, ->x{x*x})
puts succOfSquare.call(4)



puts lambda{||}.arity
puts lambda{|x| x}.arity
puts lambda{|x, y| x+y }.arity
puts lambda{|*args|}.arity
puts lambda{|first, *args|}.arity



puts lambda {|x| x*x} == lambda {|x| x*x}
p = lambda {|x| x*x}
q = p.dup
puts p == q, p.object_id == q.object_id



def multiply(data, n)
  data.collect {|x| x * n}
end

puts multiply([1,2,3], 2).inspect



def multiplier(n)
  lambda {|data| data.collect{|x| x * n } }
end

doubler = multiplier(2)
puts doubler.call([1, 2, 3]).inspect

doubler.binding.eval("n=3")
puts doubler.call([1, 2, 3]).inspect



def accessor_pair(initialValue = nil)
  value = initialValue

  getter = lambda { value }
  setter = lambda {|x| value = x }
  return getter, setter
end

getX, setX = accessor_pair(0)
print getX[], " "
setX[10]
print getX[], "\n"
