require './lib/key'
require './lib/offset'

class Shifter
  attr_reader :shift_array

  def initialize(key, date)
    @key = key
    @date = date
  end

  def get_key_array
    if @key.length != 4
      key = Key.new
      key.generate
    else
      @key.split(//).map(&:to_i)
    end
  end

  def get_offset_array
    offset = Offset.new(@date)
    offset.generate
    offset.offset_array
  end

  def self.get_shift_array(key, date)
    shifter = Shifter.new(key, date)
    key_array = shifter.get_key_array
    offset_array = shifter.get_offset_array
    combined_array = key_array.zip(offset_array)
    combined_array.map {|nums| nums.sum}
  end
end
