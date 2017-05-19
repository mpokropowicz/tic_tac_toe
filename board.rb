class Board

	attr_accessor :board
	attr_reader :width, :height 

	def initialize(width, height)

		@width = width
		@height = height
		@board_size = width * height

		@board = Array.new(@board_size, "")
	end

	def is_position_occupied?(index)

		board[index] != ""
	end

	def all_spots_occupied?

		@board.count("") == 0
	end

	def set_position(index, value)

		@board[index] = value
	end

	def to_s

		"This #{@width}x#{@height} board has #{@board_size} elements."
	end
end