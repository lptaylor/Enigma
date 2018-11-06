require './lib/enigma'

encrypted, decrypted, key, date = ARGV
encrypted = File.open(encrypted, 'r')
decrypted = File.new(decrypted, 'w')
enigma = Enigma.new

File.foreach(encrypted) do |line|
  decrypt = enigma.decrypt(line, key, date)
  decrypted.puts(decrypt[:decryption])
end

decrypted.close

p "Created 'decrypted.txt' with the key #{key} and #{date}"
