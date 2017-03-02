require_relative "board.rb"
require_relative "random_ai.rb"

class ConsoleGame

	attr_accessor :board, :current_player, :p1, :p2

	def initialize(p1, p2)

		@p1 = p1
		@p2 = p2
		@current_player = @p1

		@board = Board.new(3,3)
	end

	def greet_text

		"Welcome to Tic Tac Toe!"
	end

	def change_player

		 current_player == p1 ? current_player = p2 :  current_player = p1
	end

	def display
		
		board.height.times do |col|
			board.width.times do |row|

				print board.board[row]			
			end

			puts ""
		end
	end

	def make_move(index)

		board.set_position(index, current_player.marker)
	end

	def winner?

		result = false
		wins = 			[[board.board[0],board.board[1],board.board[2]],
                         [board.board[3],board.board[4],board.board[5]],
                         [board.board[6],board.board[7],board.board[8]],
                         [board.board[0],board.board[3],board.board[6]],
                         [board.board[1],board.board[4],board.board[7]],
                         [board.board[2],board.board[5],board.board[8]],
                         [board.board[0],board.board[4],board.board[8]],
                         [board.board[2],board.board[4],board.board[6]]]

        wins.each do |winner|

        	result = winner.count(current_player.marker) == 3
        	break if result
        end

        result
	end

	def to_s

		"The current player is #{@current_player}"
	end
end