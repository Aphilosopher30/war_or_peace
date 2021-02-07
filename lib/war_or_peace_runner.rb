require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require './lib/game'

card1 = Card.new(:heart, '2', 2)
card2 = Card.new(:heart, '3', 3)
card3 = Card.new(:heart, '4', 4)
card4 = Card.new(:heart, '5', 5)
card5 = Card.new(:heart, '6', 6)
card6 = Card.new(:heart, '7', 7)
card7 = Card.new(:heart, '8', 8)
card8 = Card.new(:heart, '9', 9)
card9 = Card.new(:heart, '10', 10)
card10 = Card.new(:heart, 'Jack', 11)
card11 = Card.new(:heart, 'Queen', 12)
card12 = Card.new(:heart, 'King', 13)
card13 = Card.new(:heart, 'Ace', 14)
card14 = Card.new(:diamond, '2', 2)
card15 = Card.new(:diamond, '3', 3)
card16 = Card.new(:diamond, '4', 4)
card17 = Card.new(:diamond, '5', 5)
card18 = Card.new(:diamond, '6', 6)
card19 = Card.new(:diamond, '7', 7)
card20 = Card.new(:diamond, '8', 8)
card21 = Card.new(:diamond, '9', 9)
card22 = Card.new(:diamond, '10', 10)
card23 = Card.new(:diamond, 'Jack', 11)
card24 = Card.new(:diamond, 'Queen', 12)
card25 = Card.new(:diamond, 'King', 13)
card26 = Card.new(:diamond, 'Ace', 14)
card27 = Card.new(:spade, '2', 2)
card28 = Card.new(:spade, '3', 3)
card29 = Card.new(:spade, '4', 4)
card30 = Card.new(:spade, '5', 5)
card31 = Card.new(:spade, '6', 6)
card32 = Card.new(:spade, '7', 7)
card33 = Card.new(:spade, '8', 8)
card34 = Card.new(:spade, '9', 9)
card35 = Card.new(:spade, '10', 10)
card36 = Card.new(:spade, 'Jack', 11)
card37 = Card.new(:spade, 'Queen', 12)
card38 = Card.new(:spade, 'King', 13)
card39 = Card.new(:spade, 'Ace', 14)
card40 = Card.new(:clubs, '2', 2)
card41 = Card.new(:clubs, '3', 3)
card42 = Card.new(:clubs, '4', 4)
card43 = Card.new(:clubs, '5', 5)
card44 = Card.new(:clubs, '6', 6)
card45 = Card.new(:clubs, '7', 7)
card46 = Card.new(:clubs, '8', 8)
card47 = Card.new(:clubs, '9', 9)
card48 = Card.new(:clubs, '10', 10)
card49 = Card.new(:clubs, 'Jack', 11)
card50 = Card.new(:clubs, 'Queen', 12)
card51 = Card.new(:clubs, 'King', 13)
card52 = Card.new(:clubs, 'Ace', 14)

all_cards = [card1,
  card2,
  card3,
  card4,
  card5,
  card6,
  card7,
  card8,
  card9,
  card10,
  card11,
  card12,
  card13,
  card14,
  card15,
  card16,
  card17,
  card18,
  card19,
  card20,
  card21,
  card22,
  card23,
  card24,
  card25,
  card26,
  card27,
  card28,
  card29,
  card30,
  card31,
  card32,
  card33,
  card34,
  card35,
  card36,
  card37,
  card38,
  card39,
  card40,
  card41,
  card42,
  card43,
  card44,
  card45,
  card46,
  card47,
  card48,
  card49,
  card50,
  card51,
  card52]


deck_1 = Deck.new([])
deck_2 = Deck.new([])

#this while loop deals out an equal number of cards to both players.
#(Note that if we are given an uneven number of cards,
#then the last card will not be assighned to either player.)
while all_cards.length > 1
  card_b = all_cards.sample
  deck_2.add_card(card_b)
  all_cards.delete_at(all_cards.index(card_b))

  card_a = all_cards.sample
  deck_1.add_card(card_a)
  all_cards.delete_at(all_cards.index(card_a))

end

player_a = Player.new("Aurora", deck_1)
player_m = Player.new("Megan", deck_2)

#this is where the setup ends and the game starts.
game = Game.new(player_a, player_m)
game.start

#this while loop continually repeats the process of takeing turns,
#untill someone wins or we run out of turns
while game.continue_game? == true
  p game.take_a_turn
end

p game.end_of_game_message
#the game is now over
