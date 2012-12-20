require "minitest_helper"

# class TestDeck < MiniTest::Unit::TestCase
#   def test_new_deck_size
#     deck = Deck.new
#     assert_equal(deck.cards.count, 52)
#   end
# end

describe Deck do
  it "should have 52 cards in a new deck" do
    deck = Deck.new
    deck.cards.count.must_equal 52
  end
end