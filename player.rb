class Player
  attr_reader :name
  attr_accessor :lives

  def initialize(input_name)
    @name = input_name
    @lives = 6
  end

  def lose_life
    @lives -= 1
  end

end
