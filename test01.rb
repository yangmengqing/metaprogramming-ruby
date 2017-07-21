require 'test/unit'

def to_alphanumber(s)
  s.gsub /[^\w\s]/, ''
end

class ToAlphanumberTest < Test::Unit::TestCase
  def test_strips_non_alphanumberic_characters
    assert_equal '3 the Magic Number ', to_alphanumber('#3, the *Magic, Number* ?')
  end
end

class String
  def to_alphanumeric
    gsub /[^\w\s]/, ''
  end
end

class StringExtensionsTest < Test::Unit::TestCase
  def test_strips_non_alphanumberic_characters
    assert_equal '3 the Magic Number ', '#3, the *Magic, Number* ?'.to_alphanumeric
  end
end
