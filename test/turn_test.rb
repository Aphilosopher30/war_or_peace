require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test

  def setup
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '2', 2)
    @card8 = Card.new(:diamond, '3', 3)

    @deck_1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck_2 = Deck.new([@card3, @card4, @card6, @card7])

    @player_1 = Player.new("Magan", @deck_1)
    @player_2 = Player.new("Aurora", @deck_2)

    @turn = Turn.new(@player_1, @player_2)

  end

  def test_that_there_are_turns
    assert_instance_of Turn, @turn
  end

  def test_there_is_one_player
    assert_equal @player_1, @turn.player_1
  end

  def test_there_is_another_player
    assert_equal @player_2, @turn.player_2
  end

  def test_it_can_assign_a_type
    assert_equal :basic, @turn.type
  end

  def test_it_can_assign_all_types

    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '2', 2)
    card8 = Card.new(:diamond, '2', 2)

    deck_1b = Deck.new([card1, card2, card5, card8])
    deck_2b = Deck.new([card4, card7, card3, card6])

    player_1b = Player.new("Magan", deck_1b)
    player_2b = Player.new("Aurora", deck_2b)

    deck_1c = Deck.new([card1, card2, card5, card8])

    player_1c = Player.new("Magan", deck_1c)
    player_2c = Player.new("Aurora", deck_1c)



    @turn = Turn.new(@player_1, @player_2)
    turn_b = Turn.new(player_1b, player_2b)
    turn_c = Turn.new(player_1c, player_1c)

    assert_equal :basic, @turn.type
    assert_equal :war, turn_b.type
    assert_equal :mutually_assured_destruction, turn_c.type


  end

  def test_winner
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '2', 2)
    card8 = Card.new(:diamond, '2', 2)

    deck_1b = Deck.new([card1, card2, card5, card8])
    deck_2b = Deck.new([card4, card7, card3, card6])

    player_1b = Player.new("Magan", deck_1b)
    player_2b = Player.new("Aurora", deck_2b)

    deck_1c = Deck.new([card1, card2, card5, card8])

    player_1c = Player.new("Magan", deck_1c)
    player_2c = Player.new("Aurora", deck_1c)

    @turn = Turn.new(@player_1, @player_2)
    turn_b = Turn.new(player_1b, player_2b)
    turn_c = Turn.new(player_1c, player_1c)

    assert_equal @player_1, @turn.winner
    assert_equal player_2b, turn_b.winner
    assert_equal "No Winner", turn_c.winner


  end

  def test_winning_player

    assert_equal @player_1, @turn.winning_player(0)
    assert_equal @player_2, @turn.winning_player(2)
  end

end