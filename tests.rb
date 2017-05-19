require "minitest/autorun"
require_relative "console_game.rb"
require_relative "random_ai.rb"
require_relative "sequential_ai.rb"
require_relative "human.rb"
require_relative "unbeatable_ai.rb"
require_relative "board.rb"
require_relative "web_game.rb"

class TestBoard < Minitest::Test 

  def test_board_init

    board = Board.new(3,3)

    assert_equal(board.board, Array.new(9, ""))
  end

  def test_occupied_position

    board = Board.new(3,3)
    board.board[0] = "X"
    board.board[1] = "O"
    board.board[2] = "3"

    assert_equal(board.is_position_occupied?(0), true)
    assert_equal(board.is_position_occupied?(1), true)
    assert_equal(board.is_position_occupied?(2), true)
  end

  def test_all_spots_occupied

    board = Board.new(3,3)
    board.board = Array.new(9, "X")

    assert_equal(board.all_spots_occupied?, true)
  end

  def test_set_pos

    board = Board.new(3,3)

    board.set_position(0, "X")
    assert_equal(board.board[0], "X")

    board.set_position(1, "O")
    assert_equal(board.board[1], "O")
  end
end

class TestConsoleGame < Minitest::Test 

  def test_change_player

    p1 = HumanPlayer.new("Player1","X")
    p2 = UnbeatablePlayer.new("Player2", "O")
    game = ConsoleGame.new(p1, p2, 3, 3)

    game.change_player
    assert_equal(game.current_player, p1)

    game.change_player
    assert_equal(game.current_player, p2)
  end

  def test_make_move

    p1 = HumanPlayer.new("Player1","X")
    p2 = UnbeatablePlayer.new("Player2", "O")
    game = ConsoleGame.new(p1, p2, 3, 3)

    game.make_move(0)
    assert_equal(game.board.board[0], "O")

    game.change_player
    game.make_move(1)
    assert_equal(game.board.board[1], "X")

    game.change_player
    game.make_move(2)
    assert_equal(game.board.board[2], "O")

    assert_nil(game.make_move(2), nil)
  end

  def test_winner

    p1 = HumanPlayer.new("Player1","X")
    p2 = UnbeatablePlayer.new("Player2", "O")
    game = ConsoleGame.new(p1, p2, 3, 3)

    game.make_move(0)
    game.make_move(1)
    game.make_move(2)

    assert_equal(game.winner?, true)
  end
end

class TestWebGame < Minitest::Test

  def test_make_player

    game = WebGame.new("human1", "hard2", 3, 3)

    assert_equal(HumanPlayer.new("Player 1", "X").class, game.p1.class)
    assert_equal(UnbeatablePlayer.new("Player 2", "O").class, game.p2.class)
  end
end