require 'date'
require './lib/shifter'

class Enigma
  attr_reader :encrypted_message

  def initialize
    @shift_array = Array.new
    @alphabet = ("a".."z").to_a << " "
    @encrypted_message = ""
  end

  def encrypt(message, key = "", date = Date.today.strftime('%d%m%y'))
    shifter = Shifter.new(key, date)
    @shift_array = shifter.get_shift_array
    message_indexed = assign_index_for_message(message)
    combined_array = message_indexed.zip(@shift_array.cycle)
    clean_combined_array(combined_array)
    summed_indexs = sum_combined_array(combined_array)
    @encrypted_message = remap_array_to_message(summed_indexs).join
  end

  def assign_index_for_message(message)
    message.chars.map do |letter|
      if @alphabet.include?(letter)
        @alphabet.find_index(letter.downcase)
      else
        letter
      end
    end
  end

  def clean_combined_array(combined_array)
    combined_array.map do |element|
      if element[0].is_a?(String)
        element.delete_at(1)
      end
    end
  end

  def sum_combined_array(combined_array)
    combined_array.map do |indexs|
      if indexs[0].is_a?(String)
        indexs
      else
        (indexs.sum) % 27
      end
    end
  end

  def remap_array_to_message(summed_indexs)
    summed_indexs.flatten.map do |index|
      if index.class == String
        index
      else
        @alphabet[index]
      end
    end
  end

end
