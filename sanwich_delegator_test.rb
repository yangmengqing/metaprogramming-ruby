class SandwichMaker
  def make_me_a_sandwich
    puts 'OKAY'
  end
end

class LazyEmployee
  def initialize(sandwich_maker)
    @sandwich_maker = sandwich_maker
  end

  def method_missing(method, *args)
    if sandwich_maker.respond_to? method
      sandwich_maker.send(method, *args)
    else
      super
    end
  end
  
  private
  attr_reader :sandwich_maker
end

sandwich_maker = SandwichMaker.new
lazy_employee  = LazyEmployee.new(sandwich_maker)
lazy_employee.make_me_a_sandwich
