class Player < Participant

  def play deck
    if best_score?
      Input.puts_and_say "\n#{name}, you have a blackjack!"
      Input.puts_and_say "Your hand is #{hand_to_s}"
      Input.puts_and_say "Congratulations!"
      return
    end
    prompt
    until time_to_stop?
      take_a_card deck
      Input.puts_and_say "You drew the #{hand.last.to_s}"
      if busted?
        Input.puts_and_say "Ooooo, you busted!  Your hand value was #{hand_value}"
      elsif best_score?
        Input.puts_and_say "Congrats!  Your score is 21!"
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
    Input.puts_and_say "#{name} #{result(dealer.hand_value)} (score: #{hand_value})"
  end
end