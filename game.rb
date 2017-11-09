class Game
  attr_reader :player, :hidden_word, :guessed_letters

  def initialize(input_player, input_hidden_word)
    @player = input_player
    @hidden_word = input_hidden_word
    @guessed_letters = []
  end

  def guess(letter)
    @guessed_letters.unshift(letter)
    word_array = @hidden_word.word_to_guess.split(//)
    for char in word_array
      return if char == letter
    end
    @player.lose_life
  end


end
