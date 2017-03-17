require_relative("player.rb")

class HumanPlayer < Player


	def move_pos(board)

		puts "Please enter your position: "
		move = gets.chomp.to_i
	end

	def move_pos_web(board,  move)

		move
	end
end