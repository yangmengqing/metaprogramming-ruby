class MyClass
  def greet
    puts "Hello!"
  end
end

class MyClass
  def greet_with_log
    puts "Calling method..."
    greet_without_log
    puts "...Method called"
  end

  alias_method :greet_without_log, :greet
  alias_method :greet, :greet_with_log
end

MyClass.new.greet
MyClass.new.greet_without_log
