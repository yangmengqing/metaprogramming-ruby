require 'benchmark'

COUNT = 10_000_000
NAME = "Test Name"
EMAIL = "test@example.org"

class Person
  attr_accessor :name, :email
  
  def set_with_hash(options = {})
    @name = options[:name] || "default name"
    @email = options[:email] || "default@example.org"
  end
  
  def set_with_keywords(name: "default name", email: "default@example.org")
    @name = name
    @email = email
  end
end

Benchmark.bm(10) do |x|
  x.report("hash:") do
    COUNT.times do
      p = Person.new
      p.set_with_hash(name: NAME, email: EMAIL)
    end
  end

  x.report("keywords:") do
    COUNT.times do
      p = Person.new
      p.set_with_keywords(name: NAME, email: EMAIL)
    end
  end
end
