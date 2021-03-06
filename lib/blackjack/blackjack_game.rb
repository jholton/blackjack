class BlackjackGame

  def initialize
    @players = []
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def meet_players
    Input.puts_and_say "How many players do we have?"
    player_count = gets.to_i
    player_count.times do |i|
      @players << Player.new
    end

    @players.each_with_index do |p, i|
      Input.puts_and_say  "\nWhat is Player #{i+1}\\'s name?"
      p.name = gets.strip
    end
    @players
  end

  def deal_a_round_of_cards
    @dealer.take_a_card(@deck)
    @players.each{|p| p.take_a_card @deck}
  end

  def dealer_has_blackjack?
    if @dealer.best_score?
      Input.puts_and_say "\nOh no, the dealer has 21!  Fork over the chips."
      Input.puts_and_say "The dealer\\s hand is #{@dealer.hand_to_s}"
      Input.puts_and_say "Thanks for playing."
      #TODO exit game here
      true
    else
      Input.puts_and_say "\nThe dealer\\'s top card is #{@dealer.hand.first.to_s}"
      false
    end
  end

  def play
    Input.puts_and_say "Shuffle up."
    self.meet_players
    Input.puts_and_say "\nDealing first two cards."
    2.times{ deal_a_round_of_cards }
    return "  :)  " if dealer_has_blackjack?
    #OK, let's start the rounds
    players_play @players, @deck
    dealer_plays @dealer, @deck
    Input.puts_and_say "\nDealer\\'s hand value is #{@dealer.hand_value}\n"
    @players.each do |p|
      puts p.result_summary @dealer
    end
    Input.puts_and_say "\nThanks for playing!"
  end

  def players_play players, deck
    players.each do |p|
      p.play deck
    end
  end

  def dealer_plays dealer, deck
    Input.puts_and_say "\nOK, dealer\\'s turn!"
    Input.puts_and_say "\nDealer\\'s hand is #{dealer.hand_to_s}"
    sleep 1
    dealer.play deck
  end
end