require "date"
class Enigma
  include Cryptor
  def initialize
    @character_set = ("a".."z").to_a << " "
    @random_key = rand(0..99999).to_s.rjust(5, "0")
  end

  def encrypt(message, key = @random_key, date = Date.today.strftime("%d%m%y"))
    message = message.downcase
    shifts = final_shifts(key, date)
    encryption = encryption(message, shifts, @character_set)
    # encryption = message.chars.map.with_index { |char, index|
    #   if @character_set.include?(char)
    #     @character_set[(@character_set.index(char) + shifts[index % 4]) % 27]
    #   else
    #     char
    #   end
    # }.join
    {encryption: encryption, key: key, date: date}
  end

  def decrypt(message, key = @random_key, date = Date.today.strftime("%d%m%y"))
    message = message.downcase
    shifts = final_shifts(key, date)
    decryption = message.chars.map.with_index { |char, index|
      if @character_set.include?(char)
        @character_set[(@character_set.index(char) - shifts[index % 4]) % 27]
      else
        char
      end
    }.join
    {decryption: decryption, key: key, date: date}
  end
end
