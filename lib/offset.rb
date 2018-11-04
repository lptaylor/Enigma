require 'date'

class Offset
  attr_reader :date

  def initalize(date = Date.new.strft('%d%m%y'))
    @date = date
  end
end
