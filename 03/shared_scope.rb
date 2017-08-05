def define_methods
  shared = 1
  
  define_method :counter do
    shared
  end

  define_method :inc do |x|
    shared += x
  end
end

define_methods
puts counter
puts inc(4)
puts counter
