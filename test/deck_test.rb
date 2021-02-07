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

    assert_equal 12, deck.rank_of_card_at(0)
    assert_equal 3, deck.rank_of_card_at(1)
    assert_equal 14, deck.rank_of_card_at(2)
    assert_equal 0, deck.rank_of_card_at(3)

  end

  def test_high_ranking_cards
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:spade, '3', 3)
    card_3 = Card.new(:heart, 'Ace', 14)
    array_of_cards = [card_1, card_2, card_3]

    deck = Deck.new(array_of_cards)

    assert_equal [card_1, card_3], deck.high_ranking_cards
  end

  def test_high_ranking_cards_works_on_non_default_settings
    card_1 = Card.new(:diamond, '8', 8)
    card_2 = Card.new(:spade, '3', 3)
    card_3 = Card.new(:heart, 'Queen', 12)
    array_of_cards = [card_1, card_2, card_3]

    deck = Deck.new(array_of_cards)

    assert_equal [card_1, card_2, card_3], deck.high_ranking_cards(2)
    assert_equal [card_1, card_3], deck.high_ranking_cards(7)
    assert_equal [card_3], deck.high_ranking_cards(8)
    assert_equal [], deck.high_ranking_cards(13)
  end

  def test_percent_high_ranking
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:spade, '3', 3)
    card_3 = Card.new(:heart, 'Ace', 14)
    array_of_cards = [card_1, card_2, card_3]

    deck = Deck.new(array_of_cards)

    assert_equal 66.67, deck.percent_high_ranking
  end

  def test_remove_card
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:spade, '3', 3)
    card_3 = Card.new(:heart, 'Ace', 14)
    card_4 = card_1
    array_of_cards = [card_1, card_2, card_3, card_4]

    deck = Deck.new(array_of_cards)

    card_to_remove = deck.remove_card

    assert_equal card_1, card_to_remove
    assert_equal [card_2, card_3, card_4], array_of_cards

  end

  def test_add_card
    card_1 = Card.new(:diamond, 'Queen', 12)
    card_2 = Card.new(:spade, '3', 3)
    card_3 = Card.new(:heart, 'Ace', 14)
    array_of_cards = [card_1, card_2, card_3]
    deck = Deck.new(array_of_cards)

    card_4 = Card.new(:club, '5', 5)

    assert_equal [card_1, card_2, card_3, card_4], deck.add_card(card_4)

  end

end
