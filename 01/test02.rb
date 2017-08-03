require 'test/unit'

def replace(array, from, to)
  array.each_with_index do |e, i|
    array[i] = to if array[i] == from
  end
end

class ToReplaceTest < Test::Unit::TestCase
  def test_replace
    book_topics = %w(html java css)
    replace(book_topics, 'java', 'ruby')
    expected = %w(html ruby css)
    assert_equal expected, book_topics
  end
end

a = [1, 2, 3, 4]
a.replace([3, 4])
puts a

class Array
  def substitute(from, to)
    each_with_index do |e, i|
      self[i] = to if e == from
    end
  end
end

class ArrayReplaceTest < Test::Unit::TestCase
  def test_replace_array
    book_topics = %w(html java css)
    book_topics.substitute('java', 'ruby')
    expected = %w(html ruby css)
    assert_equal expected, book_topics
  end
end

a = [1, 2, 3, 4]
a.replace([3, 4])
puts a
