module MyModule
  def my_method; 'hello'; end
end

class MyClass
  extend MyModule
end

puts MyClass.my_method
