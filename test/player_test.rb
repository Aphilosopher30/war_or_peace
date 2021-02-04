require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'

class PlayerTest < Minitest::Test
  def test_the_player_exists
    deck = Deck.new([Card.new(:diamond, 'Queen', 12), Card.new(:spade, '3', 3), Card.new(:heart, 'Ace', 14)])
    player_1 = Player.new("Clarisa", deck)

    assert_instance_of Player, player_1
  end

  def test_name
    deck = Deck.new([Card.new(:diamond, 'Queen', 12), Card.new(:spade, '3', 3), Card.new(:heart, 'Ace', 14)])
    player_1 = Player.new("Clarisa", deck)

    assert_equal "Clarisa", player_1.name
  end

  def test_deck
    deck = Deck.new([Card.new(:diamond, 'Queen', 12), Card.new(:spade, '3', 3), Card.new(:heart, 'Ace', 14)])
    player_1 = Player.new("Clarisa", deck)

    assert_equal deck, player_1.deck
  end




end
