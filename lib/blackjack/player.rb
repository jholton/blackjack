class Player < Participant

  def play deck
    if best_score?
      puts "\n#{name}, you have a blackjack!"
      puts "Your hand is #{hand_to_s}"
      puts "Congratulations!"
      return
    end
    prompt
    until time_to_stop?
      take_a_card deck
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

  def result(dealer_hand_value)
    if hand_value > 21
      "busted"
    elsif dealer_hand_value > 21
      "won!"
    elsif hand_value > dealer_hand_value
      "won!"
    elsif hand_value == dealer_hand_value
      "pushed"
    elsif hand_value < dealer_hand_value
      "dealer won"
    else
      "uh, somthing's wrong"
    end
  end

  def result_summary dealer
    puts "#{name} #{result(dealer.hand_value)} (score: #{hand_value})"
  end
end