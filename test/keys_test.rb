require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/keys'

class KeysTest < Minitest::Test

  def test_it_exists
    keys = Keys.new

    assert_instance_of Keys, keys
  end

end
