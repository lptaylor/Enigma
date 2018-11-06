require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/key'

class KeyTest < Minitest::Test

  def test_it_exists
    key = Key.new

    assert_instance_of Key, key
  end

  def test_it_has_a_method_that_will_generate_a_number
    key = Key.new
    actual = key.generate

    assert_instance_of Integer, actual[0]
    assert_instance_of Integer, actual[3]
  end

  def test_make_base_array_makes_a_five_digit_base
    key = Key.new
    actual = key.make_base_array

    assert_equal 5, actual.count
  end

  def test_combine_array_will_output_correctly
    key = Key.new
    expected = [[1,2],[2,3],[3,4],[4,5],[5,nil]]
    actual = key.combine_array([1,2,3,4,5])
    assert_equal expected, actual
  end

end
