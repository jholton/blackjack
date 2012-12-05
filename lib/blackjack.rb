require "blackjack/version"
require "blackjack/card"
require "blackjack/deck"
require "blackjack/participant"
require "blackjack/blackjack"

module Blackjack
  puts "Would you like to play a game of Blackjack?"
  answer = gets.chomp
  if ["y","yes"].include? answer.downcase
    Blackjack.play
  else
    "OK, maybe later."
  end
end
