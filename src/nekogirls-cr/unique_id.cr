Alpha52 = ('a'..'z').to_a + ('A'..'Z').to_a

def to_s52(input)
  s = ""
  q = input
  while q > 0
    q, r = (q - 1).divmod(52)
    s = Alpha52[r] + s
    break if q == 0
  end
  return s
end

def unique_id
  to_s52(Time.now.epoch_ms)
end
