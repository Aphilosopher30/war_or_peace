require './lib/card'


class Card_generator
  attr_accessor :file_path

  def initialize(file_path)
    @file_path = file_path
  end

  def open_file
    opened_file = File.open(@file_path)
    return opened_file
  end

  def read_file(file)
    text = file.read
    return text
  end

  def test_convert_to_list(text)
    text.split("\n")
  end

  def parse_list(list)
    new_list = []
    list.each do |string|
      sub_list = string.split(",")

      striped_sub_list = sub_list.map do |element|
        element.strip
      end
      
      new_list << striped_sub_list
    end

    return new_list
  end



end
