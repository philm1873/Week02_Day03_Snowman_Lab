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

  def test_game_win_or_lose__lose
    @game.letter_guess("z")
    @hidden_word1.star_word(@hidden_word1.word_to_guess)
    received_letter = @hidden_word1.receive_letter(@game)
    decision = @hidden_word1.letter_in_word(received_letter, @hidden_word1.word_to_guess)
    @player1.guess(decision)
    @game.letter_guess("y")
    received_letter = @hidden_word1.receive_letter(@game)
    decision = @hidden_word1.letter_in_word(received_letter, @hidden_word1.word_to_guess)
    @player1.guess(decision)
    @game.letter_guess("r")
    received_letter = @hidden_word1.receive_letter(@game)
    decision = @hidden_word1.letter_in_word(received_letter, @hidden_word1.word_to_guess)
    @player1.guess(decision)
    @game.letter_guess("h")
    received_letter = @hidden_word1.receive_letter(@game)
    decision = @hidden_word1.letter_in_word(received_letter, @hidden_word1.word_to_guess)
    @player1.guess(decision)
    @game.letter_guess("s")
    received_letter = @hidden_word1.receive_letter(@game)
    decision = @hidden_word1.letter_in_word(received_letter, @hidden_word1.word_to_guess)
    @player1.guess(decision)
    @game.letter_guess("c")
    received_letter = @hidden_word1.receive_letter(@game)
    decision = @hidden_word1.letter_in_word(received_letter, @hidden_word1.word_to_guess)
    @player1.guess(decision)
    assert_equal("Sorry, you've lost :(", @game.win_or_lose(@player1, @hidden_word1))
  end

  def test_game_win_or_lose__win
    @game.letter_guess("l")
    @hidden_word1.star_word(@hidden_word1.word_to_guess)
    received_letter = @hidden_word1.receive_letter(@game)
    decision = @hidden_word1.letter_in_word(received_letter, @hidden_word1.word_to_guess)
    @hidden_word1.change_star_to_letter(received_letter, @hidden_word1.word_to_guess, @hidden_word1.display_word)
    @player1.guess(decision)
    @game.letter_guess("a")
    received_letter = @hidden_word1.receive_letter(@game)
    decision = @hidden_word1.letter_in_word(received_letter, @hidden_word1.word_to_guess)
    @hidden_word1.change_star_to_letter(received_letter, @hidden_word1.word_to_guess, @hidden_word1.display_word)
    @player1.guess(decision)
    @game.letter_guess("p")
    received_letter = @hidden_word1.receive_letter(@game)
    decision = @hidden_word1.letter_in_word(received_letter, @hidden_word1.word_to_guess)
    @hidden_word1.change_star_to_letter(received_letter, @hidden_word1.word_to_guess, @hidden_word1.display_word)
    @player1.guess(decision)
    @game.letter_guess("t")
    received_letter = @hidden_word1.receive_letter(@game)
    decision = @hidden_word1.letter_in_word(received_letter, @hidden_word1.word_to_guess)
    @hidden_word1.change_star_to_letter(received_letter, @hidden_word1.word_to_guess, @hidden_word1.display_word)
    @player1.guess(decision)
    @game.letter_guess("o")
    received_letter = @hidden_word1.receive_letter(@game)
    decision = @hidden_word1.letter_in_word(received_letter, @hidden_word1.word_to_guess)
    @hidden_word1.change_star_to_letter(received_letter, @hidden_word1.word_to_guess, @hidden_word1.display_word)
    @player1.guess(decision)
    assert_equal("Hooray, you've won!", @game.win_or_lose(@player1, @hidden_word1))
  end
end
