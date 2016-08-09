class SlotMachine
  @reel_one = %w(A B C B D E A A B D E C B D A B D E)
  @reel_two = %w(E D E B C A B E D A B C D E A A B B B D D D C E D A D)
  @reel_tri = %w(B B D E A E D A C B E A B D E A C D)

  def self.spin
    case @reel_one.sample + @reel_two.sample + @reel_tri.sample
      when 'AAA' then 100
      when 'BBB' then  80
      when 'CCC' then  60
      when 'DDD' then  40
      when 'EEE' then  20
      when 'ABC' then  10
      when 'EDC' then   5
      else              0
    end
  end
end

win = 0

(10**6).times { |count| win += SlotMachine.spin - 1 }

puts "Winning in 1,000,000 rounds - #{win} credits. Average winning - #{Float(win)/(10**6)}."
