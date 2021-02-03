require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'



class DeckTest < Minitest::Test
  def test_the_deck_exists
    deck = Deck.new([Card.new(:diamond, 'Queen', 12), Card.new(:spade, '3', 3), Card.new(:heart, 'Ace', 14)])

    assert_instance_of Deck, deck
  end


  def test_the_deck_has_cards
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:spade, '3', 3)
    card_3 = Card.new(:heart, 'Ace', 14)
    array_of_cards = [card_1, card_2, card_3]

    deck = Deck.new(array_of_cards)

    assert_equal [card_1, card_2, card_3], deck.cards
  end

  def test_rank_of_card_at
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:spade, '3', 3)
    card_3 = Card.new(:heart, 'Ace', 14)
    array_of_cards = [card_1, card_2, card_3]

    deck = Deck.new(array_of_cards)

    for index in 0..(deck.cards.length - 1)
      assert_equal array_of_cards[index].rank, deck.rank_of_card_at(index)
    end

  end

  def test_high_ranking_cards
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:spade, '3', 3)
    card_3 = Card.new(:heart, 'Ace', 14)
    array_of_cards = [card_1, card_2, card_3]

    deck = Deck.new(array_of_cards)

    assert_equal [card_1, card_3], deck.high_ranking_cards
  end

  def test_percent_high_ranking
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:spade, '3', 3)
    card_3 = Card.new(:heart, 'Ace', 14)
    array_of_cards = [card_1, card_2, card_3]

    deck = Deck.new(array_of_cards)

    assert_equal 66.67, deck.percent_high_ranking
  end


end
