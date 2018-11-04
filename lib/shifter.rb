require './lib/key'
require './lib/offset'
require 'date'

class Shifter
  attr_reader :shift_array,:key_array, :offset_array

  def initialize(date = Date.today.strftime('%d%m%y'))
    @date = date
    @offset_array = Array.new
    @key_array = Array.new
    @shift_array = Array.new
  end

  def get_key_array
    key = Key.new
    key.generate
    @key_array = key.key_array
  end

  def get_offset_array
    offset = Offset.new(@date)
    offset.generate
    @offset_array = offset.offset_array
  end

  def get_shift_array
    get_key_array
    get_offset_array
    combined_array = @key_array.zip(@offset_array)
    @shift_array = combined_array.map {|nums| nums.sum}
  end
end
