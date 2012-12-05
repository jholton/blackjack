class Player < Participant

  def play
    if best_score?
      puts "\n#{name}, you have a blackjack!"
      puts "Your hand is #{hand_to_s}"
      puts "Congratulations!"
      break
    end
    prompt
    until time_to_stop?
      take_a_card @deck
      puts "You drew the #{hand.last.to_s}"
      if busted?
        puts "Ooooo, you busted!  Your hand value was #{hand_value}"
      elsif best_score?
        puts "Congrats!  You're score is 21!"
      else
        prompt
      end
    end
  end

  def time_to_stop?
    busted? || best_score? || gets.strip == "stay"
  end
end