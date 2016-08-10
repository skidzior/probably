class Game
  def initialize
    @discount_i = 0
  end

  def generate
    hit = (0..100).to_a.sample
    cost = (@discount_i > 0 ? -5 : -10)
    @discount_i -= 1 if @discount_i > 0

    case
    when (25..40).include?(hit) then cost += 20
    when (45..60).include?(hit) then @discount_i = 10
    end

    cost
  end
end

win = 0
game = Game.new

(10**6).times { win += game.generate }

puts "Winning in 1,000,000 rounds - #{win} credits. Average winning - #{Float(win)/(10**6)}."
