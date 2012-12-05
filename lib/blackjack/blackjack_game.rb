class BlackjackGame

  def initialize
    @players = []
  end

  def self.meet_players
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

  def self.play
    puts "Shuffle up."
    @dealer = Dealer.new
    @deck = Deck.new

    puts "Dealer says:  How many players do we have?"

    players = Player.meet_players

    puts "\nDealing first two cards."

    2.times do
      @dealer.take_a_card @deck
      players.each{|p| p.take_a_card @deck}
    end

    if @dealer.best_score?
      puts "\nOh no, the dealer has 21!  Fork over the chips."
    else
      puts "\nThe dealer's top card is #{@dealer.hand.first.to_s}"
    end

    #OK, let's start the rounds

    players.each do |p|
      if p.best_score?
        puts "\n#{p.name}, you have a blackjack!"
        puts "Your hand is #{p.hand_to_s}"
        puts "Congratulations!"
        next
      end
      p.prompt
      until p.busted? || p.best_score? || gets.strip == "stay"
        p.take_a_card @deck
        puts "You drew the #{p.hand.last.to_s}"
        if p.busted?
          puts "Ooooo, you busted!  Your hand value was #{p.hand_value}"
        elsif p.best_score?
          puts "Congrats!  You're score is 21!"
        else
          p.prompt
        end
      end
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

    players.each do |p|
      puts "#{p.name} #{p.result(@dealer.hand_value)} (score: #{p.hand_value})"
    end

    puts "\nThanks for playing!"
  end
end