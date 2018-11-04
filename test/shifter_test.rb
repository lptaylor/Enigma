require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/shifter'

class ShifterTest < Minitest::Test

  def test_it_exists
    shifter = Shifter.new

    assert_instance_of Shifter, shifter
  end

  def test_if_can_calculate_shift_via_offset_and_key_with_date
    shifter = Shifter.new("030918")
    shifter.get_shift_array

    assert_equal 4, shifter.shift_array.length
  end

  def test_if_can_calculate_shift_without_supplied_date
    shifter = Shifter.new
    shifter.get_shift_array

    assert_equal 4, shifter.shift_array.length
  end
end
