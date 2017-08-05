#def event(name, &block)
#  @events[name] = block
#end
#
#def setup(&block)
#  @setups << block
#end

lambda {
  setups = []
  events = {}

  Kernel.send :define_method, :event do |name, &block|
    events[name] = block
  end

  Kernel.send :define_method, :setup do |&block|
    setups << block
  end

  Kernel.send :define_method, :each_event do |&block|
    events.each_pair do |name, event|
      block.call name, event
    end
  end

  Kernel.send :define_method, :each_setup do |&block|
    setups.each do |setup|
      block.call setup
    end
  end
}.call

Dir.glob('*events.rb').each do |file| 
  #@events = {}
  #@setups = []
  load file
  #@events.each do |name, event|
  each_event do |name, event|
    env = Object.new
    #@setups.each { |setup| env.instance_eval &setup } 
    each_setup { |setup| env.instance_eval &setup } 
    puts "ALTER: #{name}" if env.instance_eval &event
  end
end
