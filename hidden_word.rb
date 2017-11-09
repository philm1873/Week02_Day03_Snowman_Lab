class HiddenWord

  attr_reader :word_to_guess, :display_word

  def initialize(input_word)
    @word_to_guess = input_word
  end

  def display_word(guessed_letters)
    display_word = ""
    word_array = @word_to_guess.split(//)
    for char in word_array
      if guessed_letters.include?(char) || char == " "
        display_word << char
      else
        display_word << "*"
      end
    end
    return display_word
  end

end
