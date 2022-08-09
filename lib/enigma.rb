require "date"
class Enigma
  def initialize
    @character_set = ("a".."z").to_a << " "
    @random_key = rand(0..99999).to_s.rjust(5, "0")
  end

  def encrypt(message, key = @random_key, date = Date.today.strftime("%d%m%y"))
    message = message.downcase
    offsets = ((date.to_i ** 2) % 10000).to_s
    shifts = [key[0..1].to_i + offsets[0].to_i, key[1..2].to_i + offsets[1].to_i,
            key[2..3].to_i + offsets[2].to_i, key[3..4].to_i + offsets[3].to_i]
    encryption = message.chars.map.with_index { |char, index|
      @character_set[(@character_set.index(char) + shifts[index % 4]) % 27]
    }.join
    # require "pry"; binding.pry
    {encryption: encryption, key: key, date: date}
  end
end
