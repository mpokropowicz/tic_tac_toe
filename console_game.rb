class ConsoleGame

	attr_accessor :board

	def initialize(board, p1, p2)

		@board = board
		@p1 = p1
		@p2 = p2
		@current_player = @p1
	end

	def greet_text

		"Welcome to Tic Tac Toe!"
	end

	def change_player

		 @current_player == @p1 ? @current_player = @p2 :  @current_player = @p1
	end

	def to_s

		"The current player is #{@current_player}"
	end
end