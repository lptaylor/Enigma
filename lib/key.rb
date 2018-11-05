class Key
  attr_reader :key_array

  def generate
    base_array = make_base_array
    interm_key_array = combine_array(base_array)
    cut_down_array(interm_key_array)
  end

  def make_base_array
    base_array = Array.new
    until base_array.length == 5
      base_array << rand(10)
    end
    base_array
  end

  def combine_array(base_array)
    base_array.zip(base_array[1..4])
  end

  def cut_down_array(interm_key_array)
    interm_key_array.map do |num|
      num.join.to_i
    end[0..3]
  end


end
