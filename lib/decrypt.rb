require './lib/enigma'
require 'date'

initial, output, key, date = ARGV
encrypted = File.open(initial, 'r')
decrypted = File.new(output, 'w')
enigma = Enigma.new
date = Date.today.strftime('%d%m%y')

File.foreach(encrypted) do |line|
  decrypt = enigma.decrypt(line, key, date)
  decrypted.puts(decrypt[:decryption])
end

decrypted.close

p "Created #{output} with the key #{key} and #{date}"
