require "./lib/enigma"
enigma = Enigma.new
encryption = File.open(ARGV[0]).read

decryption = enigma.decrypt(encryption, ARGV[2], ARGV[3])
File.open(ARGV[1], "w").write(decryption[:decryption])

p "Created '#{ARGV[1]}' with the key #{decryption[:key]} and date #{decryption[:date]}"
