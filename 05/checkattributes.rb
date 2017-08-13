class CheckAttributes
  def self.attr_accessor(attribute)
    define_method("#{attribute}=") do |value|
      eval("@#{attribute} = value")
    end

    define_method "#{attribute}" do
      eval("@#{attribute}")
    end
  end

  attr_accessor :att
end

c = CheckAttributes.new
c.att = 'yang'
puts c.att



