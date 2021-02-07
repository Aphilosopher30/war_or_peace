require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require './lib/game'


class  GameTest < Minitest::Test

  def setup
    @card1 = Card.new(:heart, '2', 2)
    @card2 = Card.new(:heart, '3', 3)
    @card3 = Card.new(:heart, '4', 4)
    @card4 = Card.new(:heart, '5', 5)
    @card5 = Card.new(:heart, '6', 6)
    @card6 = Card.new(:heart, '7', 7)
    @card7 = Card.new(:heart, '8', 8)
    @card8 = Card.new(:heart, '9', 9)
    @card9 = Card.new(:heart, '10', 10)
    @card10 = Card.new(:heart, 'Jack', 11)
    @card11 = Card.new(:heart, 'Queen', 12)
    @card12 = Card.new(:heart, 'King', 13)
    @card13 = Card.new(:heart, 'Ace', 14)
    @card14 = Card.new(:diamond, '2', 2)
    @card15 = Card.new(:diamond, '3', 3)
    @card16 = Card.new(:diamond, '4', 4)
    @card17 = Card.new(:diamond, '5', 5)
    @card18 = Card.new(:diamond, '6', 6)
    @card19 = Card.new(:diamond, '7', 7)
    @card20 = Card.new(:diamond, '8', 8)
    @card21 = Card.new(:diamond, '9', 9)
    @card22 = Card.new(:diamond, '10', 10)
    @card23 = Card.new(:diamond, 'Jack', 11)
    @card24 = Card.new(:diamond, 'Queen', 12)
    @card25 = Card.new(:diamond, 'King', 13)
    @card26 = Card.new(:diamond, 'Ace', 14)
    @card27 = Card.new(:spade, '2', 2)
    @card28 = Card.new(:spade, '3', 3)
    @card29 = Card.new(:spade, '4', 4)
    @card30 = Card.new(:spade, '5', 5)
    @card31 = Card.new(:spade, '6', 6)
    @card32 = Card.new(:spade, '7', 7)
    @card33 = Card.new(:spade, '8', 8)
    @card34 = Card.new(:spade, '9', 9)
    @card35 = Card.new(:spade, '10', 10)
    @card36 = Card.new(:spade, 'Jack', 11)
    @card37 = Card.new(:spade, 'Queen', 12)
    @card38 = Card.new(:spade, 'King', 13)
    @card39 = Card.new(:spade, 'Ace', 14)
    @card40 = Card.new(:clubs, '2', 2)
    @card42 = Card.new(:clubs, '3', 3)
    @card42 = Card.new(:clubs, '4', 4)
    @card43 = Card.new(:clubs, '5', 5)
    @card44 = Card.new(:clubs, '6', 6)
    @card45 = Card.new(:clubs, '7', 7)
    @card46 = Card.new(:clubs, '8', 8)
    @card47 = Card.new(:clubs, '9', 9)
    @card48 = Card.new(:clubs, '10', 10)
    @card49 = Card.new(:clubs, 'Jack', 11)
    @card50 = Card.new(:clubs, 'Queen', 12)
    @card51 = Card.new(:clubs, 'King', 13)
    @card52 = Card.new(:clubs, 'Ace', 14)


    @deck_1 = Deck.new([@card1, @card2, @card5, @card8, @card9, @card12])
    @deck_2 = Deck.new([@card3, @card4, @card6, @card7, @card10, @card11])

    @player1 = Player.new("Magan", @deck_1)
    @player2 = Player.new("Aurora", @deck_2)

    @game = Game.new(@player1, @player2)

  end

  def test_there_is_a_game
    assert_instance_of Game, @game
  end

  def test_it_has_a_player1
    assert_equal @player1, @game.player1
  end

  def test_it_has_a_player2
    assert_equal @player2, @game.player2
  end

  def test_it_has_a_max_default_number_of_turns
    assert_equal 1000000, @game.max_number_of_turns
  end

  def test_it_has_a_max_different_number_of_turns
    game = Game.new(@player1, @player2, 10)
    assert_equal 10, game.max_number_of_turns
  end

  def test_the_game_can_start
    assert_equal "GO", @game.start
  end
end
