require './lib/card'
require './lib/deck'
require './lib/player'
#require 'pry'; binding.pry

class Turn
  attr_reader :player1, :player2, :spoils_of_war, :type

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @type = self.assign_type
  end

#this method should run at
  def assign_type
    if @player1.deck.cards[0].rank != @player2.deck.cards[0].rank
      return :basic
    elsif @player1.deck.cards[2].rank != @player2.deck.cards[2].rank
      return :war
    else
      return :mutually_assured_destruction
    end
  end

#this tells the winner function which player has a higher card a a specific index
  def winning_player(card_index)
    if @player1.deck.cards[card_index].rank > @player2.deck.cards[card_index].rank
      return @player1
    elsif @player1.deck.cards[card_index].rank < @player2.deck.cards[card_index].rank
      return @player2
    else
      print "Oops, something whent wrong with the 'winning_player method'!"
    end
  end

#this figurs out which player wins the conflict
  def winner
    if @type == :basic
      winner = self.winning_player(0)
    elsif @type == :war
      winner = self.winning_player(2)
    elsif @type == :mutually_assured_destruction
      "No Winner"
    else
      print "Oops, something whent wrong with 'winner' method!"
    end
  end

#this method puts removes cards from each players deck
#and puts them in a pile or deleats them from game
#it knows how many cards to take based on the turn type
  def pile_cards
    if @type == :basic
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    elsif @type == :war
      3.times do
        @spoils_of_war << @player1.deck.remove_card
        @spoils_of_war << @player2.deck.remove_card
      end
    elsif @type == :mutually_assured_destruction
      3.times do
        @player1.deck.remove_card
        @player2.deck.remove_card
      end
    else
      "OOPS: Not a valid turn type"
    end
  end

#takes cards put in pile by
  def award_spoils(winner)
    if winner == @player1 || winner == @player2
      winner.deck.cards.concat(self.spoils_of_war)
    else
      @spoils_of_war.clear
    end
  end

#this method provides a printable summery describing what append and  much the winner has won
  def turn_summery(winner)
    if @type == :basic
      "#{winner.name} won #{self.spoils_of_war.length} cards"
    elsif @type == :war
      "WAR - #{winner.name} won #{self.spoils_of_war.length} cards"
    elsif @type == :mutually_assured_destruction
      "*mutually assured destruction* 6 cards removed"
    else
      "SOMETHING WENT HORRIBLY WRONG!!!"
    end
  end

end
