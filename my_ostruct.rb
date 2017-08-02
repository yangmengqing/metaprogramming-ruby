class OpenStruct
  def initialize
    @arr = {}
  end

  def method_missing(name, *args)
    attribute = name.to_s
    if attribute =~ /=$/
      @arr[attribute.chop] = args[0]
    else
      @arr[attribute]
    end
  end
end

ice = OpenStruct.new
ice.flavor = 'vanilla'
puts ice.flavor
