
class Player
attr_reader :name
attr_accessor :score
  def initialize(name)
    @name = name
    @score = 4
  end
end


class Flashcard
attr_reader :definition, :answer
  def initialize(args={})
    @definition = args.fetch(:definition)
    @answer = args.fetch(:answer)
  end
end

# test_flash = Flashcard.new({})

# p test_player = Player.new("ali")

