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


end
