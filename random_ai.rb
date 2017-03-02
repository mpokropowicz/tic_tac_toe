require_relative "player.rb"

class RandomPlayer < Player

	def rand_position(board_size)

		rand(board_size + 1)
	end
end