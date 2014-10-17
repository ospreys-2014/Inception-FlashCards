class Player

attr_reader :name, :score

  def initialize(name)
    @name = name
    @score = 0
  end

end


class Flashcard

attr_reader :definition

  def initialize(args={})
    @definition = args.fetch(:definition)
    @answer = args.fetch(:answer)
  end


end

# test_flash = Flashcard.new({})

# p test_player = Player.new("ali")

