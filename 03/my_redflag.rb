#def event(name, &block)
#  @events[name] = block
#end
#
#def setup(&block)
#  @setups << block
#end

class CleanRedflag
  def initialize
    @setups = []
    @events = {}
  end

  #Kernel.send :define_method, :event do |name, &block|
  #  @events[name] = block
  #end

  #Kernel.send :define_method, :setup do |&block|
  #  @setups << block
  #end
end

#clean_room = CleanRedflag.new
Dir.glob('*events.rb').each do |file| 
  clean_room = CleanRedflag.new
  clean_room.instance_eval do
    load file
    puts 'yang'
    @events.each do |name, event|
      @setups.each { |setup| setup.call }
      puts "ALTER: #{name}" if event.call
    end
  end
end
