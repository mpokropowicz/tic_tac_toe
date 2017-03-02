require "minitest/autorun"
require_relative "console_game.rb"

class TestConsoleGame < Minitest::Test 

	def test_start_message

		game = ConsoleGame.new("", "")

		assert_equal("Welcome to Tic Tac Toe!", game.greet_text)
	end

	def test_board_array

		game = ConsoleGame.new("", "")

		assert_equal(["","","", "","","", "","",""], game.board)
	end

	def test_switch_players

		game = ConsoleGame.new("p1", "p2")

		assert_equal("p2", game.change_player)
	end
end