require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
#require './lib/war_or_peace_runner'




class Game
  attr_reader :turn_counter, :player1, :player2, :max_number_of_turns

  def initialize(player1, player2, max_number_of_turns = 1000000)
    @player1 = player1
    @player2 = player2
    @max_number_of_turns = max_number_of_turns
    @turn_counter = 0
  end


  def print_intro_message
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are #{@player1.name} and #{@player2.name}."
    p "Type 'GO' to start the game!"
    p "------------------------------------------------------------------"
  end

#This message does not let start the game untill you type "GO"
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


  def increment_turn_counter
    @turn_counter += 1
  end

#this determines whether it's time to end the game
  def continue_game?
    if @player1.has_lost? == false && @player2.has_lost? == false && @turn_counter < @max_number_of_turns
      return  true
    else
      return false
    end
  end

#returns a string we can print that provides info on the turn.
  def printable_results_of_a_turn(winner, turn)
    "Turn #{@turn_counter}: " + turn.turn_summery(winner)
  end

#returns a printable string telling us who wone this crule game of war
  def end_of_game_message
    if @player1.has_lost? == false && @player2.has_lost? == true
      "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
    elsif @player2.has_lost? == false && @player1.has_lost? == true
      "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
    elsif turn_counter >= max_number_of_turns || (@player1.has_lost? && @player2.has_lost?)
      "----DRAW----"
    else
      "something's wrong. we don't know who won."
    end
  end

#this method takes a turn. this includes increasing the turn count,
#as well as awarding cards to the winner,
#and finally returning a string summerizing the changes that can be printed out
  def take_a_turn
    self.increment_turn_counter
    this_turn = Turn.new(self.player1, self.player2)

    the_winner = this_turn.winner

    this_turn.pile_cards
    this_turn.award_spoils(the_winner)

    self.printable_results_of_a_turn(the_winner, this_turn)

  end

end
