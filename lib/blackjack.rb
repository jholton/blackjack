require "blackjack/version"
require "blackjack/card"
require "blackjack/deck"
require "blackjack/participant"
require "blackjack/dealer"
require "blackjack/player"
require "blackjack/blackjack_game"

module Blackjack
  puts "Would you like to play a game of Blackjack?"
  answer = gets.chomp
  if ["y","yes"].include? answer.downcase
    bjg = BlackjackGame.new
    bjg.play
  else
    "OK, maybe later."
  end

  def puts_and_say phrase
    puts phrase
    `say #{phrase}`
  end
end
