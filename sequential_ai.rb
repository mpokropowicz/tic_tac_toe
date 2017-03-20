require_relative "player.rb"
require_relative "board.rb"

class SequentialPlayer < Player

	def initalize

		super(@seq_index)
	end

	def move_pos(board)

		board.board.index("")
	end
end