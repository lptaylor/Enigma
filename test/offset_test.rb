require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset'

class OffsetTest < Minitest::Test

  def test_it_exists
    offset = Offset.new

    assert_instance_of Offset, offset
  end

  def test_it_can_take_in_a_date
    offset = Offset.new("041018")

    assert_equal "041018", offset.date
  end

  def test_it_defalts_to_todays_date
    offset = Offset.new

    assert_equal Date.today.strftime('%d%m%y'), offset.date
  end

  def test_it_can_generate_the_offset
    offset = Offset.new("041018")
    offset.generate

    assert_equal [6,3,2,4], offset.offset_array
  end
end