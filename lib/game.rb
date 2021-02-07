require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
#require './lib/war_or_peace_runner'




class Game
  attr_reader :turn_number, :player1, :player2, :max_number_of_turns

  def initialize(player1, player2, max_number_of_turns = 1000000)
    @player1 = player1
    @player2 = player2
    @max_number_of_turns = max_number_of_turns
    @turn_number = 0
  end


  def print_intro_message
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are #{@player1.name} and #{@player2.name}."
    p "Type 'GO' to start the game!"
    p "------------------------------------------------------------------"
  end

  def start
    self.print_intro_message
    start = gets
    while start.upcase.strip != "GO"
      p "I'm sorry you typed #{start}. And we are having a hard time understing this."
      p "We really need you to type 'GO'"
      start = gets
    end
    return start.upcase.strip
  end
end
