class Game
  attr_reader :player, :hidden_word, :guessed_letters

  def initialize(input_player, input_hidden_word)
    @player = input_player
    @hidden_word = input_hidden_word
    @guessed_letters = []
  end

  def letter_guess(letter)
    @guessed_letters.unshift(letter)
  end




end
