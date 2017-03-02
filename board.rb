class Board

	attr_accessor :board 

	def initialize(width, height)

		@width = width
		@height = height
		@board_size = width * height

		self.make_board
	end

	def make_board

		@board = Array.new(@board_size, "")
	end

	def is_position_occupied?(index)

		@board[index] != ""
	end

	def all_spots_occupied?

		@board.count("") == 0
	end

	def set_position(index, value)

		@board[index - 1] = value
	end

	def to_s

		"This #{@width}x#{@height} board has #{@board_size} elements."
	end
end

board = Board.new(3,3)

print board

