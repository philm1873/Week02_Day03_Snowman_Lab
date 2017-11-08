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


end
