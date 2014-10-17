# require 'models.rb'
require 'CSV'

class Controller
  attr_accessor :deck, :players
  def initialize
    @deck = []
    set_deck
    @players = []
  end

  def read_file(file)
    File.foreach(file) do |line| @deck << line end
    #slice
    new_array = []
    @deck.each_slice(3) do |triplet|
      new_array << triplet
    end

    @deck = new_array.map do |pair| Flashcard.new ({definition: pair[0], answer: pair[1]})

  end

  def set_deck
    file = "source/flashcards_samples.txt"
    read_file (file)
  end

end

User = Controller.new





