require_relative("player.rb")

class HumanPlayer < Player


	def move_pos(board)

		puts "Please enter your position: "
		move = gets.chomp.to_i
	end
end