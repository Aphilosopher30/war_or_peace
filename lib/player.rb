 require './lib/deck'
 require './lib/card'


class Player
  attr_accessor :name, :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?

    if self.deck.cards == []
       looser = true
    else
       looser = false
    end
    return looser
  end



end
