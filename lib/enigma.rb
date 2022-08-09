require "date"
require_relative "cryptor"
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
    {encryption: encryption, key: key, date: date}
  end

  def decrypt(message, key = @random_key, date = Date.today.strftime("%d%m%y"))
    message = message.downcase
    shifts = final_shifts(key, date)
    decryption = decryption(message, shifts, @character_set)
    {decryption: decryption, key: key, date: date}
  end
end
