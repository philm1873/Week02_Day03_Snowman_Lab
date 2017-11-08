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

  def win_or_lose(player, hidden_word)
    if player.lives == 0
      return "Sorry, you've lost :("
    elsif hidden_word.word_to_guess == hidden_word.display_word
      return "Hooray, you've won!"
    end
  end


end
