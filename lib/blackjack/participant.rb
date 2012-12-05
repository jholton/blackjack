class Participant

  attr_accessor :hand, :name

  def initialize(type = "player", name = "Degenerate Gambler", *hand)
    @hand = hand  #should be cards
    @name = name
    @type = type
  end

  def take_a_card deck
    @hand << deck.cards.shift
  end

  def hand_value
    sum = @hand.inject(0){|sum, c| sum + c.value}
    if sum > 21 && @hand.any?{|c| c.name == "A"}
      sum -= 10
    end
    sum
  end

  def busted?
    hand_value > 21
  end

  def best_score?
    hand_value == 21
  end

  def hand_to_s
    @hand.map{|c| c.to_s}.join(", ")
  end

  def prompt
    puts "\nDealer says:  #{name}, your hand is #{hand_to_s}"
    puts "What do you want to do?"
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
end