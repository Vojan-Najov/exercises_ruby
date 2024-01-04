class Widget
  def x
    @x
  end
  protected :x

  def utility_method
    nil
  end
  private :utility_method
end

if __FILE__ == $0

  w = Widget.new

  w.send :utility_method
  w.instance_eval { utility_method }
  w.instance_eval { @x }

end
