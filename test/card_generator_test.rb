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
    expected_text = generator.read_file(text_file)

    text_from_file = "2, Heart, 2\n10, Heart, 10\nKing, Heart, 13\nAce, Heart, 14\n"

    assert_equal text_from_file, expected_text
  end








end
