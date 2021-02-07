require './lib/card'

class Deck
  attr_accessor :cards

  def initialize(cards)
    @cards  = cards
  end

#finds the rank of a card at specified index
  def rank_of_card_at(index_number)
    #this if statment assumes that if a deck runs out of cars,
    #then the rank of a non-existant card will be 0.
    #there are other options we could try, such as...
    #"look at the last card in the deck and use it's rank"
    #but this is the one we are going with untill instructed other wise.
    if self.cards[index_number] == nil
      return 0
    else
      return self.cards[index_number].rank
    end
  end

#returns a list of face cards (can be changed to cards above any value)
  def high_ranking_cards(cut_off = 10)
    high_cards = []
    for card in self.cards
      if card.rank > cut_off
        high_cards.append(card)
      end
    end

    return high_cards
  end

#tells you what percentage of your cards are face cards
  def percent_high_ranking
    number_of_high_cards = self.high_ranking_cards.length.to_f
    number_of_all_cards = self.cards.length.to_f

    percentage = number_of_high_cards / number_of_all_cards
    percentage_rounded = (percentage * 100).round(2)

    return percentage_rounded
  end

#deleats a card from the top of a  deck.
  def remove_card
    self.cards.delete_at(0)
  end

#this method puts a new card at the botom of a deck
  def add_card(new_card)
    self.cards.append(new_card)
  end

end
