require './lib/card'



class Deck
  def initialize(cards)
    @cards  = cards
  end

  def cards
    return @cards
  end

  def rank_of_card_at(index_number)
    return self.cards[index_number].rank
  end

  def high_ranking_cards
    high_cards = []
    for card in self.cards
      if card.rank > 10
        high_cards.append(card)
      end
    end

    return high_cards

  end

  def percent_high_ranking
    number_of_high_cards = self.high_ranking_cards.length.to_f
    number_of_all_cards = self.cards.length.to_f

    percentage = number_of_high_cards / number_of_all_cards
    percentage_rounded = (percentage * 100).round(2)

    return percentage_rounded
  end


end
