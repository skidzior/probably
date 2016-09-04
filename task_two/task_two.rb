require 'distribution'

class Game
  @@win_arr = [ 3, 0, 2, 15, 1, 1.5, 4, 5, 7, 55 ]

  def self.play(calculate = false)
    rounds = 2000.0

    prizes = (1..rounds).map { @@win_arr[dice_throw] - 1 }
    won = prizes.inject(:+)

    mean = won/rounds
    if calculate
      dev = Math.sqrt(prizes.map {|x| (x - mean)**2}.inject(:+) / rounds)
      [mean, dev]
    else
      mean
    end
  end

  def self.dice_throw
    case rand(1000)
    when    0...150 then 0
    when  150...800 then 1
    when  800...870 then 2
    when  870...900 then 3
    when  900...910 then 4
    when  910...930 then 5
    when  930...945 then 6
    when  945...960 then 7
    when  960...990 then 8
    else                 9
    end
  end
end

def calc_borders(payback, deviation, confidence)
  standard_error = deviation / Math.sqrt(1000) 
  probability = 1 - (1 - confidence) / 2

  margin = Distribution::Normal.p_value(probability) * standard_error

  (payback - margin..payback + margin)
end

payback, deviation = Game.play(true)
confidence = 0.9

interval = calc_borders(payback, deviation, confidence)

tries = 1000
passed = (1..tries).map { interval.include? Game.play }.count(true)

puts "Predicted payback percentage at #{confidence*100}\% confidence level \
is in interval (#{interval.first.round(3)}, #{interval.last.round(3)}). "
puts "#{passed} paybacks out of #{tries} games were in the interval."
