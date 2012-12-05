class Deck
  SUITS = [:clubs, :spades, :diamonds, :hearts]
  NAME_VALUES = {"2" => 2, "3" => 3, "4" => 4,
                 "5" => 5, "6" => 6, "7" => 7,
                 "8" => 8, "9" => 9, "10" => 10,
                 "J" => 10, "Q" => 10, "K" => 10, "A" => 11}

  attr_accessor :cards

  def initialize
    @cards ||= []
    SUITS.each do |suit|
      NAME_VALUES.each do |name, value|
        @cards << Card.new(suit, name, value)
      end
    end
    @cards.shuffle!
  end
end