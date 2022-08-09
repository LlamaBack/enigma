require "./lib/enigma"
enigma = Enigma.new
message = File.open(ARGV[0]).read

encryption = enigma.encrypt(message)
File.open(ARGV[1], "w").write(encryption[:encryption])

p "Created '#{ARGV[1]}' with the key #{encryption[:key]} and date #{encryption[:date]}"
