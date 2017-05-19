require_relative "board.rb"
require_relative "random_ai.rb"

class ConsoleGame

	attr_accessor :board, :current_player, :p1, :p2

	def initialize(p1, p2, w, h)

		@p1 = p1
		@p2 = p2
		@current_player = @p2

		@board = Board.new(w,h)
	end

	def greet_text

		print "Welcome to Tic Tac Toe!\n\n"
	end

	def change_player

		 @current_player == @p1 ? @current_player = @p2 :  @current_player = @p1
	end

	def display
		
		row = 0
		@board.height.times do |col|
			@board.width.times do

				print @board.board[row]
				row += 1		
			end

			puts ""
		end
		puts "\n"
	end

	def make_move(index)
    puts "#{index}"

		if @board.is_position_occupied?(index) == false

			@board.set_position(index, @current_player.marker)
		else

			print "That spot is already taken!\n"
		end
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

        	result = winner.count(current_player.marker) == @board.height
        	break if result
        end

        result
	end

	def to_s

		"The current player is #{@current_player}"
	end
end

# p1 = RandomPlayer.new("Player1","X")
# p2 = RandomPlayer.new("Player2", "O")

# game = ConsoleGame.new(p1, p2)

#  game.board.board = ["a", "a", "a", 
#  					"a", "a", "a", 
#  					"a", "a", "a"]
# print game.board.board
# puts ""
# game.make_move(1)
# print game.board.board
# puts ""
# game.display