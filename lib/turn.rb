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

  def assign_type
    if @player1.deck.cards[0].rank != @player2.deck.cards[0].rank
      return :basic
    elsif @player1.deck.cards[2].rank != @player2.deck.cards[2].rank
      return :war
    else
      return :mutually_assured_destruction
    end
  end

  def winning_player(card_index)
    if @player1.deck.cards[card_index].rank > @player2.deck.cards[card_index].rank
      return @player1
    elsif @player1.deck.cards[card_index].rank < @player2.deck.cards[card_index].rank
      return @player2
    else
      print "Oops, something whent wrong with the 'winning_player method'!"
    end
  end

  def winner
    if self.type == :basic
      winner = self.winning_player(0)
    elsif self.type == :war
      winner = self.winning_player(2)
    elsif self.type == :mutually_assured_destruction
      "No Winner"
    else
      print "Oops, something whent wrong with the 'winner method'!"
    end
  end


  def pile_cards
    if self.type == :basic
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    elsif self.type == :war
      3.times do
        @spoils_of_war << @player1.deck.remove_card
        @spoils_of_war << @player2.deck.remove_card
      end
    elsif self.type == :mutually_assured_destruction
      3.times do
        @player1.deck.remove_card
        @player2.deck.remove_card
      end
    else
      "OOPS: Not a valid turn type"
    end
  end

  def award_spoils(winner)
    if winner == @player1 || winner == @player2
      winner.deck.cards.concat(self.spoils_of_war)
    else
      @spoils_of_war = []
    end
  end

end
