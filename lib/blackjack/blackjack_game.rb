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
      puts "\nWhat is Player #{i+1}'s name?"
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
    if @dealer.best_score?
      puts "\nOh no, the dealer has 21!  Fork over the chips."
      #TODO exit game here
    else
      puts "\nThe dealer's top card is #{@dealer.hand.first.to_s}"
    end
  end

  def play
    puts "Shuffle up."

    puts "Dealer says:  How many players do we have?"

    meet_players

    puts "\nDealing first two cards."

    2.times{ deal_a_round_of_cards }

    check_for_blackjack

    #OK, let's start the rounds

    @players.each do |p|
      p.play @deck
      puts @deck.cards.count
    end

    puts "\nOK, dealer's turn!"

    puts "\nDealer's hand is #{@dealer.hand_to_s}"

    sleep 1

    while @dealer.hand_value < 17
      @dealer.take_a_card @deck
      puts "Dealer drew #{@dealer.hand.last.to_s}"
      sleep 1
      puts "Oooo, dealer busted!" if @dealer.busted?
    end

    puts "\nDealer's hand value is #{@dealer.hand_value}\n"

    @players.each do |p|
      puts "#{p.name} #{p.result(@dealer.hand_value)} (score: #{p.hand_value})"
    end

    puts "\nThanks for playing!"
  end
end