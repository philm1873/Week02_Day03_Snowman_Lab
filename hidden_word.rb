class HiddenWord

  attr_reader :word_to_guess, :display_word

  def initialize(input_word)
    @word_to_guess = input_word
    @display_word = ""
  end

  def star_word(word_to_guess)
    word_array = word_to_guess.split(//)
     for letter in word_array
       letter.replace "*"
      end
      @display_word = word_array.join
    end

    def receive_letter(game)
      game.guessed_letters[0]
    end

    def letter_in_word(guessed_letter, word_to_guess)
      word_array = word_to_guess.split(//)
        for letter in word_array
          if letter == guessed_letter
            return true
          end
        end
        return false
    end

    def change_star_to_letter(guessed_letter, word_to_guess, starred_word)
      word_array = word_to_guess.split(//)
      starred_word_array = starred_word.split(//)
      index = 0
      for letter in word_array
        if letter == "*" && letter != guessed_letter
            index += 1
          elsif letter == "*" && letter == guessed_letter
            starred_word_array[index] = guessed_letter
            index += 1
          else
            index += 1
        end
        @display_word = starred_word_array.join
      end
    end

end
