require './lib/key'
require './lib/offset'
require 'date'

class Shifter
  attr_reader :shift_array

  def initialize(date = Date.today.strftime('%d%m%y'))
    @date = date
    @offset_array = Array.new
    @key_array = Array.new
    @shift_array = Array.new
  end

  def get_shift_array
    offset = Offset.new(@date)
    offset.generate
    offsets = offset.offset_array
    combined_array = keys.zip(offsets)
    @shift_array = combined_array.map {|nums| nums.sum}
  end

  def get_key_array
    key = Key.new
    key.generate
    keys = key.key_array
  end

end
