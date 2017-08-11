require 'test/unit'

class Fixnum
  alias :old_plus :+

  def +(value)
    self.old_plus(value).old_plus(1)
    #old_result = old_plus(value)
    #result = old_result.old_plus(1)
    #result
  end
end


class BrokenMathTest < Test::Unit::TestCase
  def test_math_is_broken
    assert_equal 2, 1 + 1
    assert_equal 0, -1 + 1
    assert_equal 111, 100 + 10
  end
end
