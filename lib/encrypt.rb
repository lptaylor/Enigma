require './lib/enigma'

message, encrypted = ARGV

message = File.new('r')
encrypted = File.new('w')

enigma = Enigma.new
enigma.encrypt(message)

p "Created 'encrypted.txt' with the key #{encrypt[:key]} and #{encrypt[:date]}"
