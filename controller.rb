require_relative 'models.rb'
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

    @deck = new_array.map do |pair| Flashcard.new ({definition: pair[0], answer: pair[1]}) end

  end

  def set_deck
    file = "source/flashcards_samples.txt"
    read_file (file)
  end

  def set_players
    puts "How many players"
    num = gets.chomp
    counter = 1
    while counter<=num.to_i
      @players << Player.new(counter)
      counter=counter+1
    end
  end

  def winner?
      @players.each{|player| return true if player.score == 5}
      return false
  end

  def display_winner(player)
    puts "Congrats Player #{player.name} you win"
  end

  def start_game
    until winner?
      @players.map do |player|
        card = @deck.shift
        2.times do
          puts " Player #{player.name}    Your question:"
          puts card.definition
          user_answer = gets
          if (card.answer).downcase == (user_answer).downcase
            puts "IM in ......................................"
            player.score = player.score + 1
            break
          else
            puts " Try again, moron"
          end
        end
        if winner?
          display_winner(player)
          break
        end
      end
    end
  end


end

User = Controller.new
User.set_players
User.start_game
