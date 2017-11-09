require("minitest/autorun")
require("minitest/rg")
require_relative("../game.rb")
require_relative("../player.rb")
require_relative("../hidden_word.rb")

class TestGame < MiniTest::Test
  def setup
    @player = Player.new("Catriona")
    @hidden_word = HiddenWord.new("laptop")
    @game = Game.new(@player, @hidden_word)
  end

  def test_guess__fail
    @game.guess("z")
    assert_equal(1, @game.guessed_letters.length)
    assert_equal(5, @player.lives)
  end

  def test_guess__pass
    @game.guess("a")
    assert_equal(1, @game.guessed_letters.length)
    assert_equal(6, @player.lives)
  end

  def test_game_lost
    @player.lives = 0
    assert_equal(true, @game.game_lost)
  end

  def test_game_won__false
    @hidden_word.word_to_guess = "l*ptop"
    assert_equal(false, @game.game_won)
  end

  def test_game_won__false
    @hidden_word.word_to_guess = "laptop"
    assert_equal(true, @game.game_won)
  end

end
