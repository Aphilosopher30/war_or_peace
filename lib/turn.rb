require './lib/deck'
require './lib/card'
require './lib/player'
#require "pry"; binding.pry

class Turn
  attr_reader :player_1, :player_2, :spoils_of_war

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @type = self.type
    @spoils_of_war = []
  end

  def type
    if @player_1.deck.cards[0].rank != @player_2.deck.cards[0].rank
      return :basic
    elsif @player_1.deck.cards[2].rank != @player_2.deck.cards[2].rank
      return :war
    else
      return :mutually_assured_destruction
    end
  end


  def winning_player(card_index)
    if @player_1.deck.cards[card_index].rank > @player_2.deck.cards[card_index].rank
      return @player_1
    elsif @player_1.deck.cards[card_index].rank < @player_2.deck.cards[card_index].rank
      return @player_2
    else
      print "Oops, something whent wrong with the 'winning_player method'!"
    end
  end

  def winner
    if @type == :basic
      winner = self.winning_player(0)
    elsif @type == :war
      winner = self.winning_player(2)
    elsif @type == :mutually_assured_destruction
      "No Winner"
    else
      print "Oops, something whent wrong with the 'winner method'!"
    end
  end


  def pile_cards
    if @type == :basic
      @spoils_of_war << @player_1.deck.remove_card
      @spoils_of_war << @player_2.deck.remove_card
    elsif @type == :war
      3.times do
        @spoils_of_war << @player_1.deck.remove_card
        @spoils_of_war << @player_2.deck.remove_card
      end
    elsif @type == :mutually_assured_destruction
      3.times do
        @player_1.deck.remove_card
        @player_2.deck.remove_card
      end
    else
      "OOPS: Not a valid turn type"
    end
  end

  def award_spoils(winner)
    if winner == @player_1 || winner == @player_2
      winner.deck.cards.concat(self.spoils_of_war)
    else
      @spoils_of_war = []
    end
  end




end
