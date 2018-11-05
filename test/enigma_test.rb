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
    enigma.encrypt("Hello world!")

    assert_equal 12, enigma.encrypted_message.length
  end

  def test_it_can_encyrpt_a_message_with_only_key
    enigma = Enigma.new
    enigma.encrypt("Hello world!", "1232")

    assert_equal 12, enigma.encrypted_message.length
  end

  def test_it_can_encyrpt_a_message_with_only_date
    enigma = Enigma.new
    enigma.encrypt("Hello world!", "120918")

    assert_equal 12, enigma.encrypted_message.length
  end

  def test_it_can_encyrpt_a_message_with_both_date_and_key
    enigma = Enigma.new
    enigma.encrypt("Hello world!","1234", "120918")

    assert_equal "knqtriawuui!", enigma.encrypted_message
  end

  def test_it_can_decyrpt_a_message
    enigma = Enigma.new
    enigma.decrypt("knqtriawuui!","1234", "120918")

    assert_equal "hello world!", enigma.decrypted_message
  end
end
