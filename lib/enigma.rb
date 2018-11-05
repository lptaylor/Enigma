require 'date'
require './lib/shifter'

class Enigma

  def initialize
    @shift_array = Array.new
    @alphabet = ("a".."z").to_a << " "
  end

  def encrypt(message, key = "", date = Date.today.strftime('%d%m%y'))
    shifter = Shifter.new(key, date)
    @shift_array = shifter.get_shift_array
    message_indexed = message.chars.map do |letter|
                      if @alphabet.include?(letter)
                        @alphabet.find_index(letter.downcase)
                      else
                        letter
                      end
                    end
    combined_array = message_indexed.zip(@shift_array.cycle)
    #clean array of mismatched classes
    combined_array.map do |element|
      if element[0].class == String
        element.delete_at(1)
      end
    end
    summed_indexs = combined_array.map do |indexs|
      if indexs[0].class == String
        indexs
      else
        (indexs.sum) % 27
      end
    end
    encrypted = summed_indexs.flatten.map do |index|
      if index.class == String
        index
      else
        @alphabet[index]
      end
    end
    encrypted.join
    require 'pry';binding.pry
  end



end
