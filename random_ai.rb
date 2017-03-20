require_relative "player.rb"

class RandomPlayer < Player

	def move_pos(board)

		
		available_places = board.board.each_index.select{|i| board.board[i] == ''}
		available_places[rand(available_places.length) - 1]
	end
end