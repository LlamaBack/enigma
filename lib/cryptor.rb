module Cryptor
  def final_shifts(key, date)
    offsets = ((date.to_i ** 2) % 10000).to_s
    [key[0..1].to_i + offsets[0].to_i, key[1..2].to_i + offsets[1].to_i,
     key[2..3].to_i + offsets[2].to_i, key[3..4].to_i + offsets[3].to_i]
  end

  def encryption(message, shifts)
    
  end
end
