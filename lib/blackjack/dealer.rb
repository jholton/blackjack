class Dealer < Participant
  def has_to_hit?
    hand_value < 17
  end

  def play deck
    while has_to_hit?
      take_a_card deck
      Input.puts_and_say "Dealer drew #{hand.last.to_s}"
      sleep 1
      Input.puts_and_say "Oooo, dealer busted!" if busted?
    end
  end
end