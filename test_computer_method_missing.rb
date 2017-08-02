require_relative 'data_source'

class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end

  def respond_to?(method)
    @data_source.respond_to? "get_#{method}_info" || super
  end

  def method_missing(method, *args)
    super unless @data_source.respond_to? "get_#{method}_info"
    device = method.to_s
    info = @data_source.send "get_#{device}_info", @id
    price = @data_source.send("get_#{device}_price", @id)
    result = " #{device.capitalize}: #{info} ($#{price})"
    return " *#{result}" if price >= 100
    result
  end
end

c = Computer.new(2, DataSource.new)
puts c.cpu
puts c.keyboard
puts c.mouse
puts c.respond_to? :mouse
