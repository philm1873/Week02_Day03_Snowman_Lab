require("minitest/autorun")
require("minitest/rg")
require_relative("../game.rb")
require_relative("../player.rb")
require_relative("../hidden_word.rb")

class TestGame < MiniTest::Test
  def setup
    @player1 = Player.new("Catriona")
    @hidden_word1 = HiddenWord.new("laptop")
    @game = Game.new(@player1, @hidden_word1)
  end

  def test_get_player
    assert_equal(6, @game.player.lives)
    assert_equal("Catriona", @game.player.name)
  end

  def test_received_letter__first
    @game.letter_guess("z")
    assert_equal(1, @game.guessed_letters.length)
  end
end
