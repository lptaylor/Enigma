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

# "Created 'encrypted.txt' with the key 91383 and 051118"
p "Created 'decrypted.txt' with the key #{key} and #{date}"
