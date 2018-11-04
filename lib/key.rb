class Key
  attr_reader :key_array

  def initialize
    @key_array = Array.new
  end

  def generate
    until @key_array.length == 5
      @key_array << rand(10)
    end
  end

end
