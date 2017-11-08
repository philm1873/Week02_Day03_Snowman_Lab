class Player
  attr_reader :name, :lives

  def initialize(input_name)
    @name = input_name
    @lives = 6
  end

  def guess(decision)
    @lives -= 1 if decision == false
  end

end
