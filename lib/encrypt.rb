require './lib/enigma'

message, encrypted = ARGV
message = File.open(message, 'r')
encrypted = File.new(encrypted, 'w')
enigma = Enigma.new
key = Key.new.generate
date = Date.today.strftime('%d%m%y')
File.foreach(message) do |line|
  encrypt = enigma.encrypt(line, key, date)
  encrypted.puts(encrypt[:encryption])
end





enigma.encrypt(message)




p "Created 'encrypted.txt' with the key #{key} and #{date}"
