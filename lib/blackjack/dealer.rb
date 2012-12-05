class Dealer < Participant
  def has_to_hit?
    hand_value < 17
  end

  def play deck
    while has_to_hit?
      take_a_card deck
      puts "Dealer drew #{hand.last.to_s}"
      sleep 1
      puts "Oooo, dealer busted!" if busted?
    end
  end
end