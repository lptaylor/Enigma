require './lib/key'
require './lib/offset'

class Shifter
  attr_reader :shift_array

  def initialize(key = "", date)
    @key = key
    @date = date
    @offset_array = Array.new
    @key_array = Array.new
    @shift_array = Array.new
  end

  def get_key_array
    if @key.length != 4
      key = Key.new
      key.generate
      @key_array = key.key_array
    else
      @key_array = @key.split(//).map(&:to_i)
    end
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
