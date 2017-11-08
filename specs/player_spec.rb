require("minitest/autorun")
require("minitest/rg")
require_relative("../player.rb")

class TestPlayer < MiniTest::Test
  def setup
  @player = Player.new("Catriona")
  end

  def test_get_player_name
    assert_equal("Catriona", @player.name)
  end
  
  def test_get_lives__start
    assert_equal(6, @player.lives)
  end
end
