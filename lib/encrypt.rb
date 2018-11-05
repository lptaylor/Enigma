require './lib/enigma'

message, encrypted = ARGV
message = File.open(message, 'r')
encrypted = File.new(encrypted, 'w')
enigma = Enigma.new
key = Key.new.make_base_array.join
date = Date.today.strftime('%d%m%y')
File.foreach(message) do |line|
  encrypt = enigma.encrypt(line, key, date)
  encrypted.puts(encrypt[:encryption])
end


p "Created 'encrypted.txt' with the key #{key} and #{date}"
