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

  def test_it_can_encyrpt_a_message_with_no_supplied_key_or_offset
    enigma = Enigma.new

    assert_equal "", enigma.encrypted
  end

  def test_it_can_shift_the_alphabet
    enigma = Enigma.new
    enigma.shift_alphabet

    assert_equal "bdf", enigma.shifted_alphabet[0..2].join
  end
end
