class AbstractGreeter
  def greet
    puts "#{greeting} #{who}"
  end
end

class WorldGreeter < AbstractGreeter
  def greeting
    "Hello"
  end

  def who
    "World"
  end
end

class SpanishWorldGreeter < WorldGreeter
  def greeting
    "Hola"
  end
end

if __FILE__ == $0

  WorldGreeter.new.greet
  SpanishWorldGreeter.new.greet

end
