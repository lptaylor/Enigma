require 'date'
require './lib/shifter'

class Enigma

  def initialize
    @shift_array = Array.new
  end

  def encrypt(message, key, date = Date.today.strftime('%d%m%y'))
    shifter = Shifter.new(key, date)
  end
end
