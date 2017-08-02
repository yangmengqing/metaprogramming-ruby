require 'delegate/class'

class Assistant
  def initialize(name)
    @name = name
  end

  def read_email
    "(#{@name}) It's mostly spam"
  end

  def check_schedule
    "(#{@name}) You have a meeting today"
  end
end

class Manager < SimpleDelegator
  def initialize(assistant)
    super
  end

  def attend_meeting
    "Please hold my class."
  end

  #def method_missing(method, *args)
  #  if @assistant.respond_to? method
  #    @assistant.send(method, *args)
  #  end
  #end
end

frank = Assistant.new("Frank")
anne = Manager.new(frank)
puts anne.attend_meeting
puts anne.read_email
