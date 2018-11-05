require 'date'
require './lib/shifter'

class Enigma

  def initialize
    @shift_array = Array.new
    @alphabet = ("a".."z").to_a << " "
  end

  def encrypt(message, key, date = Date.today.strftime('%d%m%y'))
    shifter = Shifter.new(key, date)
    @shift_array = shifter.get_shift_array
    message_indexed = message.chars.map do |letter|
                        @alphabet.find_index(letter.downcase)
                      end
    combined_array = message_indexed.zip(@shift_array.cycle)
    summed_indexs = combined_array.map {|indexs| (indexs.sum) % 27}
    summed_indexs.map {|index| @alphabet[index]}
  end



end
