require_relative "player.rb"

class RandomPlayer < Player

	def move_pos

		rand(9)
	end
end