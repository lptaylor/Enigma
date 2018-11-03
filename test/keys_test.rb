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

  def test_it_has_a_class_method_that_will_generate_a_number
    key = Key.new
    key.generate

    assert_instance_of Fixnum, key_array[0]
  end

end
