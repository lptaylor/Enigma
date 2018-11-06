require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/shifter'
require 'date'

class ShifterTest < Minitest::Test

  def test_it_exists
    shifter = Shifter.new("12253", "12345")

    assert_instance_of Shifter, shifter
  end

  def test_if_can_calculate_shift_via_offset_and_key_with_date
    actual = Shifter.get_shift_array("12345", "030918")

    assert_equal 4, actual.length
  end

  def test_get_key_array_returns_a_key
    shifter = Shifter.new("12345", "030918")

    assert_equal [12,23,34,45],shifter.get_key_array("12345")
  end

  def test_get_offset_array_returns_an_array
    shifter = Shifter.new("12345", "030918")

    assert_equal [2,7,2,4], shifter.get_offset_array("030918")
  end

  def test_it_has_a_key_and_date_if_supplied
    shifter = Shifter.new("12345", "030918")

    assert_equal "12345", shifter.key
    assert_equal "030918", shifter.date
  end
end
