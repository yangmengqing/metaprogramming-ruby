require 'active_record'

class MyClass
  def save; end
  def save!; end
  def new_record?; true; end

  include ActiveRecord::Validations
  attr_accessor :attr
  validates_length_of :attr, :minimum => 6
end

obj = MyClass.new
obj.attr = 'test haha'
puts obj.valid?
obj.attr = 'test'
puts obj.valid?
