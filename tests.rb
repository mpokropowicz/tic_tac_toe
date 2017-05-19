require "minitest/autorun"
require_relative "console_game.rb"
require_relative "random_ai.rb"
require_relative "sequential_ai.rb"
require_relative "human.rb"
require_relative "unbeatable_ai.rb"
require_relative "board.rb"

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