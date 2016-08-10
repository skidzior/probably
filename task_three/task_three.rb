win = 0
discount_i = 0

(10**6).times do
  hit = (0..100).to_a.sample
  win -= (discount_i > 0 ? 5 : 10)
  discount_i -= 1 if discount_i > 0

  case
  when (25..40).include?(hit) then win += 20
  when (45..60).include?(hit) then discount_i = 10
  end
end

puts "win - #{win/1000000.0}"


x = 20 * 16/101.0 - ( 10 * ((85/101.0)**10) + 5 * (1 - ((85/101.0)**10)) )

