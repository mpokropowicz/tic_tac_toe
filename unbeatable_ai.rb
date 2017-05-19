require_relative "player.rb"

class UnbeatablePlayer < Player 


	def move_pos(board)

		if win_or_block(board) >= 0
			puts "win_or_block"
			move = win_or_block(board)

		elsif check_for_fork(board) >= 0
			puts "fork"
			move = check_for_fork(board)

		elsif block_opponents_fork(board, self.marker) >= 0
			puts "#{move}, #{move.class}"
			move = block_opponents_fork(board, self.marker)

		elsif center(board) == 4
			puts "center"
			move = center(board)
			
		elsif opposite_corner(board) >= 0
			puts "opposite_corner"
			move = opposite_corner(board)
			
		elsif empty_corner(board) >= 0
			puts "empty_corner"
			move = empty_corner(board)
			
		elsif empty_side(board) >= 0
			puts "empty_side"
			move = empty_side(board)
			
		else
			puts "rand"
			rand(9)

		end
			
	end

	def win_or_block(board)

		move = -1

		board_positions = [
							[board.board[0],board.board[1],board.board[2]],
							[board.board[3],board.board[4],board.board[5]],
							[board.board[6], board.board[7], board.board[8]],
							[board.board[0], board.board[3], board.board[6]],
							[board.board[1],board.board[4], board.board[7]],
							[board.board[2],board.board[5],board.board[8]], 
							[board.board[0], board.board[4], board.board[8]],
							[board.board[2],board.board[4],board.board[6]]
							]

		indexs = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
		
		board_positions.each_with_index do |line, index|

			if (line.count("X") == 2 && line.count("") == 1) ||
				(line.count("O") == 2 && line.count("") == 1)

				move = indexs[index][line.index("")]
			end
		end

		move
	end


	def check_for_fork(board)

		fork_combinations = [
							[board.board[0],board.board[1],board.board[2]],
							[board.board[3],board.board[4],board.board[5]],
							[board.board[6], board.board[7], board.board[8]],
							[board.board[0], board.board[3], board.board[6]],
							[board.board[1],board.board[4], board.board[7]],
							[board.board[2],board.board[5],board.board[8]], 
							[board.board[0], board.board[4], board.board[8]],
							[board.board[2],board.board[4],board.board[6]]
							]

		fork_positions = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

		fork_line = []
		fork_spot = []
		i = []
		
		fork_combinations.each_with_index do |forking_line, index|

			if forking_line.count(marker) == 1 && forking_line.count("") == 2

				fork_line = forking_line
				i.push(index)
			end
		end

		i.each do |index|

			fork_spot.push(fork_positions[index])
		end

		fork_spot = fork_spot.flatten.sort

		conditional_array = []
		fork_spot.each do |spot|

			if board.board[spot] == ""

				conditional_array.push(spot)
			end
		end

		if conditional_array.detect { |match| conditional_array.count(match) > 1 } == nil

			move = -1
		else

			move = conditional_array.detect { |match| conditional_array.count(match) > 1 }
		end

		move
	end

	def block_opponents_fork(board, cpu_marker)

		block_fork_combinations = [
								[board.board[0],board.board[1],board.board[2]],
								[board.board[3],board.board[4],board.board[5]],
								[board.board[6], board.board[7], board.board[8]],
								[board.board[0], board.board[3], board.board[6]],
								[board.board[1],board.board[4], board.board[7]],
								[board.board[2],board.board[5],board.board[8]], 
								[board.board[0], board.board[4], board.board[8]],
								[board.board[2],board.board[4],board.board[6]]
								]

		block_fork_positions = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

		if cpu_marker == "O"

			player_marker = "X"
		else

			player_marker = "O"
		end

		block_fork_line = []
		block_fork_spot = []
		i = []
		
		block_fork_combinations.each_with_index do |block_forking_line, index|

			if block_forking_line.count(player_marker) == 1 && block_forking_line.count("") == 2

				block_fork_line = block_forking_line
				i.push(index)
			end
		end

		i.each do |index|

			block_fork_spot.push(block_fork_positions[index])
		end

		block_fork_spot = block_fork_spot.flatten.sort

		block_spot = []

		if block_fork_spot.include?(4)

			move = -1
		else
			block_fork_spot.each do |spot|

				if board.board[spot] == "X" && board.board[spot + 1] == ""

					block_spot.push(spot + 1)
				else

					move = -1
				end
			end
		end

		if block_spot == []

			move = -1
		else

			move = block_spot.shift
		end

		move
	end

	def center(board)

		move = 4 if board.board[4] == ""
	end

	def opposite_corner(board)

		move = -1

		move = 8 if board.board[0] == opponent_marker && board.board[8] == ""
		move = 6 if board.board[2] == opponent_marker && board.board[6] == ""
		move = 2 if board.board[6] == opponent_marker && board.board[2] == ""
		move = 0 if board.board[8] == opponent_marker && board.board[0] == ""

		move
	end

	def empty_corner(board)

		move = -1

		[0,2,6,8].each do |index|

			if board.board[index] == ""
				move = index 
				break
			end
		end

		move
	end

	def empty_side(board)

		move = -1

		[1,3,5,7].each do |index|

			if board.board[index] = ""
				move = index 
				break
			end
		end

		move
	end

	def opponent_marker

		self.marker == "X" ? "O" : "X"
	end
end