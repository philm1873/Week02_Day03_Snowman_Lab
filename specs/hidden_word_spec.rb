require("minitest/autorun")
require("minitest/rg")
require_relative("../hidden_word.rb")

class TestHiddenWord < MiniTest::Test

  def setup
    @hidden_word1 = HiddenWord.new("laptop")
    @hidden_word2 = HiddenWord.new("whatever")
  end

  def test_get_word_to_guess
    assert_equal("laptop", @hidden_word1.word_to_guess)
  end

  def test_get_display_word__start
    assert_equal("", @hidden_word1.display_word)
  end

  def test_return_star_word__word1
    @hidden_word1.star_word(@hidden_word1.word_to_guess)
    assert_equal("******", @hidden_word1.display_word)
  end

  def test_return_star_word__word2
    @hidden_word2.star_word(@hidden_word2.word_to_guess)
    assert_equal("********", @hidden_word2.display_word)
  end

  def test_letter_in_word__true
    result = @hidden_word1.letter_in_word("a", @hidden_word1.word_to_guess)
    assert_equal(true, result)
  end

  def test_letter_in_word__false
    result = @hidden_word1.letter_in_word("z", @hidden_word1.word_to_guess)
    assert_equal(false, result)
  end









end
