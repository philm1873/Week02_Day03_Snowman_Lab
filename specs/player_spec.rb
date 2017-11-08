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
    @hidden_word1.letter_in_word(received_letter,@hidden_word1.word_to_guess)
    @player.guess()
    assert_equal(6, @player.lives)
  end

  # def test_guesses_letter__incorrect
  # end
end
