class Offset
  attr_reader :offset_array, :date

  def initialize(date)
    @date = date
    @offset_array = Array.new
  end

  def get_squared_array
    squared_number = (date.to_i**2)
    squared_number.to_s.split(//)
  end

  def generate
    @offset_array = get_squared_array[-4..-1].map do |num|
      num.to_i
    end
  end


end
