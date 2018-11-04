class Key
  attr_reader :key_array

  def initialize
    @key_array = Array.new
  end

  def generate
    base_array = Array.new
    until base_array.length == 5
      base_array << rand(10)
    end
    combined_array = base_array.zip(base_array[1..4])
    interm_key_array = combined_array[0..3]
    @key_array = interm_key_array.map do |num|
      num.join.to_i
    end
  end

end
