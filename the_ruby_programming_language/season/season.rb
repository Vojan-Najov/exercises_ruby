class Season
  NAMES = %w{ Весна Лето Осень Зима }
  INSTANCES = []

  def initialize(n)
    @n = n
  end

  def to_s
    NAMES[@n]
  end

  NAMES.each_with_index do |name, index|
    instance = new(index)
    INSTANCES[index] = instance
    const_set name, instance
  end

  private_class_method :new, :allocate

  private :dup, :clone

  def _dump(limit)
    @n.to_s
  end

  def self._load(s)
    INSTANCES[Integer(s)]
  end

end

puts Season::INSTANCES
