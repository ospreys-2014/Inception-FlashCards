require_relative 'models.rb'
require 'CSV'
require 'debugger'

class Controller
  attr_accessor :deck, :players

  def initialize
    @deck = []
    @players = []
  end

  def set_deck_array
    new_array = []
    @deck.each_slice(3) do |triplet| new_array << triplet end
    @deck = new_array.map do |pair| Flashcard.new ({definition: pair[0], answer: pair[1]}) end
  end

  def read_file(file)
    File.foreach(file) do |line| @deck << line end
  end

  def set_deck
    file = "source/flashcards_samples.txt"
    read_file(file)
    set_deck_array
  end

  def set_players
    puts "How many players?"
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

  def pick_card
    @deck.shift
  end

  def two_chances(player, card)
    2.times do
      puts " Player #{player.name}    Your question:"
      puts card.definition
      user_answer = gets.chomp
      card.answer.gsub!("\n", "")
      if (card.answer).downcase == (user_answer).downcase
        player.score += 1
        break
      else
        puts " Try again, moron"
      end
    end
  end

  def start_game
    while true
      @players.map do |player|
        two_chances(player, pick_card)
        if winner?
          display_winner(player)
          break
        end
      end
      if winner?
        break
      end
    end
  end

  # def game
  #   set_deck
  #   set_players
  #   start_game
  # end

end

user = Controller.new
user.set_deck
user.set_players
# debugger
user.start_game
