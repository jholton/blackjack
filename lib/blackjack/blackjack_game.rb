class BlackjackGame

  def initialize
    @players = []
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def meet_players
    player_count = gets.to_i
    player_count.times do |i|
      @players << instance_variable_set("@player#{i}", Player.new)
    end

    @players.each_with_index do |p, i|
      Input.puts_and_say  "\nWhat is Player #{i+1}\\'s name?"
      name = gets.strip
      p.name = name
    end
    @players
  end

  def deal_a_round_of_cards
    @dealer.take_a_card @deck
    @players.each{|p| p.take_a_card @deck}
  end

  def check_for_blackjack
    #if @dealer.best_score?
    if true
      Input.puts_and_say "\nOh no, the dealer has 21!  Fork over the chips."
      #TODO exit game here
    else
      Input.puts_and_say "\nThe dealer\\'s top card is #{@dealer.hand.first.to_s}"
    end
  end

  def play
    Input.puts_and_say "Shuffle up."

    Input.puts_and_say "How many players do we have?"

    meet_players

    Input.puts_and_say "\nDealing first two cards."

    2.times{ deal_a_round_of_cards }

    check_for_blackjack

    #OK, let's start the rounds
    players_play @players, @deck

    dealer_plays

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