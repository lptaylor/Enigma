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

  def test_it_can_encyrpt_a_message_with_only_date
    enigma = Enigma.new
    actual = enigma.encrypt("Hello world!", "120918")

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
end
