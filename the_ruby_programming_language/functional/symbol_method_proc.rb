#!/usr/bin/env -w ruby

class Symbol
  def to_proc
    lambda {|receiver, *args| receiver.method(self)[*args]}
  end
end

class Module
  alias [] instance_method

  def []=(sym, f)
    self.instance_eval { define_method(sym, f) }
  end
end

class UnboundMethod
  alias [] bind
end

class Symbol
  def [](obj)
    obj.method(self)
  end
  
  def []=(o, f)
    sym = self
    eigenclass = (class << o; self end)
    eigenclass.instance_eval { define_method(sym, f) }
  end
end



puts [1, 2, 3].map(&:succ).inspect

puts String[:reverse].bind("hello").call

puts String[:reverse]["hello"][]

Enumerable[:average] = lambda do
  sum, n = 0.0, 0
  self.each {|x| sum += x; n += 1}
  if n == 0
    nil
  else
    sum/n
  end
end

puts [1,2,3,4,5].average

dashes = :*['-']
puts dashes[10]
