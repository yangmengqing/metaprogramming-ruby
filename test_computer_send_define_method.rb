require_relative 'data_source'

class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
    data_source.methods.grep(/get_(.*)_info/) { Computer.define_compotent $1 }
  end

  def self.define_compotent(device)
    define_method(device) {
      info = @data_source.send "get_#{device}_info", @id
      price = @data_source.send("get_#{device}_price", @id)
      result = " #{device.capitalize}: #{info} ($#{price})"
      return " *#{result}" if price >= 100
      result
    }
  end
end

c = Computer.new(2, DataSource.new)
puts c.cpu
puts c.keyboard
puts c.mouse
