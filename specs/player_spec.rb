require("minitest/autorun")
require("minitest/rg")
require_relative("../player.rb")
require_relative("../game.rb")
require_relative("../hidden_word.rb")

class TestPlayer < MiniTest::Test
  def setup
    @player = Player.new("Catriona")
    @hidden_word1 = HiddenWord.new("laptop")
    @game = Game.new(@player, @hidden_word1)
  end

  def test_get_player_name
    assert_equal("Catriona", @player.name)
  end

  def test_get_lives__start
    assert_equal(6, @player.lives)
  end

  def test_guesses_letter__correct
    @game.letter_guess("a")
    received_letter = @hidden_word1.receive_letter(@game)
    letter_decision = @hidden_word1.letter_in_word(received_letter,@hidden_word1.word_to_guess)
    @player.guess(letter_decision)
    assert_equal(6, @player.lives)
  end

  def test_guesses_letter__incorrect
    @game.letter_guess("z")
    received_letter = @hidden_word1.receive_letter(@game)
    letter_decision = @hidden_word1.letter_in_word(received_letter,@hidden_word1.word_to_guess)
    @player.guess(letter_decision)
    assert_equal(5, @player.lives)
  end

  def test_change_star_to_letter
    @game.letter_guess("p")
    received_letter = @hidden_word1.receive_letter(@game)
    @hidden_word1.change_star_to_letter(received_letter, @hidden_word1.word_to_guess, @hidden_word1.display_word)
    assert_equal("**p**p", @hidden_word1.display_word)
  end
end
