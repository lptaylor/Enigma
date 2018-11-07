require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'


class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_it_can_encyrpt_a_message_with_no_supplied_key_or_date
    enigma = Enigma.new
    actual = enigma.encrypt("Hello world!")

    assert_equal 12, actual[:encryption].length
  end

  def test_it_can_encyrpt_a_message_with_only_key
    enigma = Enigma.new
    actual = enigma.encrypt("Hello world!", "12324")

    assert_equal 12, actual[:encryption].length
  end

  def test_it_can_encyrpt_a_message_with_both_date_and_key
    enigma = Enigma.new
    expected = {:encryption=>"vhufbceieom!", :key=>"12344", :date=>"120918"}
    actual = enigma.encrypt("Hello world!","12344", "120918")

    assert_equal expected, actual
  end

  def test_it_can_decyrpt_a_message
    enigma = Enigma.new
    expected = {:decryption=>"hello world!", :key=>"12344", :date=>"120918"}
    actual = enigma.decrypt("vhufbceieom!","12344", "120918")
    assert_equal expected, actual
  end

  def test_it_can_decyrpt_a_message_without_a_date
    enigma = Enigma.new
    expected = {:decryption=>"acllhywokjd!", :key=>"12344", :date=>"071118"}
    actual = enigma.decrypt("vhufbceieom!","12344")
    assert_equal expected, actual
  end

  def test_it_can_assign_a_messages_letters_to_index
    enigma = Enigma.new

    assert_equal [7,4,11,11,14], enigma.assign_index_for_message("hello")
  end

  def test_it_can_clean_a_combined_array
    enigma = Enigma.new
    array = [[1,2],[4,5],["?",5] ]

    assert_equal [nil,nil,5], enigma.clean_combined_array(array)
    assert_equal [[1, 2], [4, 5], ["?"]], array
  end

  def test_it_can_sum_combined_array
    enigma = Enigma.new
    array = [[1, 2], [4, 5], ["?"]]

    assert_equal [3,9,["?"]], enigma.sum_combined_array(array)
  end

  def test_it_can_remap_an_array_to_message
    enigma = Enigma.new
    array = [3,9,["?"]]

    assert_equal ['d','j','?'], enigma.remap_array_to_message(array)
  end

  def test_negative_array_returns_a_negative_array
    enigma = Enigma.new
    array = [1,2,3,4]

    assert_equal [-1,-2,-3,-4], enigma.negative_array(array)
  end

  def test_key_check_will_make_a_new_key
    enigma = Enigma.new

    assert_equal 5, enigma.key_check("323232").length
  end

  def test_key_check_will_return_original_key_if_correct_length
    enigma = Enigma.new

    assert_equal "32323", enigma.key_check("32323")
  end

end
