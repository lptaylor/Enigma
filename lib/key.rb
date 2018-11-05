class Key
  attr_reader :key_array

  def generate
    base_array = Array.new
    until base_array.length == 5
      base_array << rand(10)
    end
    combined_array = base_array.zip(base_array[1..4])
    interm_key_array = combined_array[0..4]
    key_array_with_extra = interm_key_array.map do |num|
      num.join.to_i
    end
    key_array_with_extra[0..3]
  end

end
