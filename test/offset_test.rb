require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset'

class OffsetTest < Minitest::Test

  def test_it_exists
    offset = Offset.new

    assert_instance_of Offset, offset
  end

  def test_it_can_take_in_a_date
    offset = Offset.new("041118")

    assert_equal "041118", offset.date
  end

  def test_it_defalts_to_todays_date
    offset = Offset.new

    assert_equal "031118", offset.date
  end

  def test_it_can_generate_the_offset
    offset = Offset.new

    assert_equal 0, offset.offset_array
  end
end
