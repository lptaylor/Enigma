require './lib/enigma'

initial, output = ARGV
message = File.open(initial, 'r')
encrypted = File.new(output, 'w')
enigma = Enigma.new
key = Key.new.make_base_array.join
date = Date.today.strftime('%d%m%y')
File.foreach(message) do |line|
  encrypt = enigma.encrypt(line, key, date)
  encrypted.puts(encrypt[:encryption])
end


p "Created #{output} with the key #{key} and #{date}"
