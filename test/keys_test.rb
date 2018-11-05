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

end
