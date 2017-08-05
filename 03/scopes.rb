v1 = 1

class MyClass
  v2 = 2
  puts 'p1', local_variables

  def my_method
    v3 = 3
    local_variables
  end

  puts 'p2', local_variables
end

obj = MyClass.new
puts obj.my_method
puts obj.my_method
puts local_variables
