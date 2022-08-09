require "date"
class Enigma
  def initialize
    @character_set = ("a".."z").to_a << " "
    @random_key = rand(0..99999).to_s.rjust(5, "0")
  end

  def encrypt(message, key = @random_key, date = Date.today.strftime("%d%m%y"))
    message = message.downcase
    shifts = final_shifts(key, date)
    encryption = message.chars.map.with_index { |char, index|
      if @character_set.include?(char)
        @character_set[(@character_set.index(char) + shifts[index % 4]) % 27]
      end
    }.join
    # require "pry"; binding.pry
    {encryption: encryption, key: key, date: date}
  end

  def decrypt(message, key = @random_key, date = Date.today.strftime("%d%m%y"))
    message = message.downcase
    shifts = final_shifts(key, date)
    decryption = message.chars.map.with_index { |char, index|
      if @character_set.include?(char)
        @character_set[(@character_set.index(char) - shifts[index % 4]) % 27]
      end
    }.join
    # require "pry"; binding.pry
    {decryption: decryption, key: key, date: date}
  end

  def final_shifts(key, date)
    offsets = ((date.to_i ** 2) % 10000).to_s
    [key[0..1].to_i + offsets[0].to_i, key[1..2].to_i + offsets[1].to_i,
     key[2..3].to_i + offsets[2].to_i, key[3..4].to_i + offsets[3].to_i]
  end

end
