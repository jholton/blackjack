require "minitest_helper"

class TestPlayer < Test::Unit::TestCase
  def test_results_vs_dealer
    p = Player.new
    p.hand = [Card.new("hearts", "8", 8), Card.new("hearts", "10", 10)]
    assert_equal(p.result(18), "you pushed")
    assert_equal(p.result(19), "the dealer won")
    assert_equal(p.result(20), "the dealer won")
  end
end
