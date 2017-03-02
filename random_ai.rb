require_relative "player.rb"

class RandomPlayer < Player

	def move_to(board_size)

		rand(board_size + 1)
	end
end