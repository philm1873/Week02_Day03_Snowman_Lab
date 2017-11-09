require("minitest/autorun")
require("minitest/rg")
require_relative("../player.rb")
require_relative("../game.rb")
require_relative("../hidden_word.rb")

class TestPlayer < MiniTest::Test
  def setup
    @player = Player.new("Catriona")
    @hidden_word = HiddenWord.new("laptop")
    @game = Game.new(@player, @hidden_word)
  end

  def test_lose_life
    @player.lose_life
    assert_equal(5, @player.lives)
  end

end
