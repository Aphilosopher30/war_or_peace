require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/card_generator'


class Card_generatorTest < Minitest::Test

  def test_card_generator_exists
    generator = Card_generator.new("file_path")

    assert_instance_of Card_generator, generator
  end

  def test_card_generator_has_name_of_a_file
    generator = Card_generator.new("file_path")

    assert_equal "file_path", generator.file_path
  end

  def test_open_file
    generator = Card_generator.new("./lib/card.txt")

    text_file = generator.open_file

    assert_equal false, text_file.closed?
  end



  def test_read_file
    generator = Card_generator.new("./test/cards_file_test.txt")
    text_file = generator.open_file
    recived_text = generator.read_file(text_file)

    text_from_file = "2, Heart, 2\n10, Heart, 10\nKing, Heart, 13\nAce, Heart, 14\n"

    assert_equal text_from_file, recived_text
  end


  def test_convert_to_list
    generator = Card_generator.new("./test/cards_file_test.txt")
    text_file = generator.open_file
    recived_text = generator.read_file(text_file)

    expected_list = ["2, Heart, 2", "10, Heart, 10","King, Heart, 13","Ace, Heart, 14"]

    assert_equal expected_list, generator.test_convert_to_list(recived_text)
  end

  def test_parse_list
    generator = Card_generator.new("./test/cards_file_test.txt")
    text_file = generator.open_file
    recived_text = generator.read_file(text_file)
    list = generator.test_convert_to_list(recived_text)

    expected_list = [['2', 'Heart', '2'], ['10', 'Heart', '10'],['King', 'Heart', '13'], ['Ace', 'Heart', '14']]

    assert_equal expected_list, generator.parse_list(list)
  end

  def test_crate_card
    starting_list = ['King', 'Heart', '13']
    generator = Card_generator.new("./test/cards_file_test.txt")
    new_card = generator.create_card(starting_list)

    assert_instance_of Card, new_card
    assert_equal "King", new_card.number
    assert_equal :heart, new_card.suit
    assert_equal 13, new_card.value

  end


end
