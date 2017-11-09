require("minitest/autorun")
require("minitest/rg")
require_relative("../hidden_word.rb")
require_relative("../game.rb")
require_relative("../player.rb")

class TestHiddenWord < MiniTest::Test

  def setup
    @player = Player.new("Catriona")
    @hidden_word = HiddenWord.new("laptop mac")
    @game = Game.new(@player, @hidden_word)
  end

  def test_display_word__start
    result = @hidden_word.display_word(@game.guessed_letters)
    assert_equal("****** ***", result)
  end

  def test_display_word__first_guess
    result = @hidden_word.display_word(["a"])
    assert_equal("*a**** *a*", result)
  end

  def test_display_word__second_guess
    result1 = @hidden_word.display_word(["a"])
    result2 = @hidden_word.display_word(["p", "a"])
    assert_equal("*ap**p *a*", result2)
  end
end
