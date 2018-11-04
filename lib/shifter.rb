require './lib/key'
require './lib/offset'
require 'date'

class Shifter

  def initialize(date = Date.today.strftime('%d%m%y'))
    @date = date
    @offset = offset
    @shift_array = shift_array
  end

  

end
