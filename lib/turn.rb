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

#this method should run at initialization to determine what type this turn is.
#after that it sould not be called.
  def assign_type
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      return :basic
    elsif @player1.deck.rank_of_card_at(2) != @player2.deck.rank_of_card_at(2)
      return :war
    else
      return :mutually_assured_destruction
    end
  end

#this tells the winner function which player has a higher card a a specific index
  def winning_player(card_index)
    if @player1.deck.rank_of_card_at(card_index) > @player2.deck.rank_of_card_at(card_index)
      return @player1
    elsif @player1.deck.rank_of_card_at(card_index) < @player2.deck.rank_of_card_at(card_index)
      return @player2
    else
      print "Oops, something whent wrong with the 'winning_player method'!"
    end
  end

#this figurs out which player wins the conflict
#NOTE: if you call pile_cards BEFOERE you call winner, you may get screwy resutls
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
#and puts them in spoils_of_war or deleats them from game
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

#takes cards put in spoils_of_war by pile_cards,
#and then it puts them on the bottom the winners deck.
  def award_spoils(winner)
    if winner == @player1 || winner == @player2
      winner.deck.cards.concat(self.spoils_of_war)
    else
      @spoils_of_war.clear
    end
  end

end
