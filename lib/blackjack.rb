require "blackjack/version"
require "blackjack/card"
require "blackjack/deck"
require "blackjack/participant"
require "blackjack/dealer"
require "blackjack/player"
require "blackjack/blackjack_game"

module Input
  class << self
    def puts_and_say phrase
      puts phrase.gsub("\\'", "'")
      `say #{phrase.gsub("\n","")}`
    end
  end
end


module Blackjack
  include Input
  Object.extend Input

  puts "Would you like to play a game of Blackjack?"
  answer = gets.chomp
  if ["y","yes"].include? answer.downcase
    bjg = BlackjackGame.new
    bjg.play
  else
    "OK, maybe later."
  end
end
