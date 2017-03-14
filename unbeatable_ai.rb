require_relative "player.rb"

class UnbeatablePlayer < Player 


	def move_pos(board)

		if win_or_block(board) >= 0
			puts "win_or_block"
			move = win_or_block(board)
		elsif fork(board) >= 0
			puts "fork"
			move = fork(board)
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

			if (line.count("X") == 2 && line.count("_") == 1) ||
				(line.count("O") == 2 && line.count("_") == 1)

				move = indexs[index][line.index("_")]
			end
		end

		move
	end

	def fork(board)

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

			if (line.count(self.marker) == 1 && line.count("_") == 2)

				move = indexs[index][line.index("_")]
			elsif (line.count(opponent_marker) == 1 && line.count("_") == 2)\

				move = indexs[index][line.index("_")]
			end
		end

		move
	end

	def center(board)

		move = 4 if board.board[4] == "_"
	end

	def opposite_corner(board)

		move = -1

		move = 8 if board.board[0] == opponent_marker && board.board[8] == "_"
		move = 6 if board.board[2] == opponent_marker && board.board[6] == "_"
		move = 2 if board.board[6] == opponent_marker && board.board[2] == "_"
		move = 0 if board.board[8] == opponent_marker && board.board[0] == "_"

		move
	end

	def empty_corner(board)

		move = -1

		[0,2,6,8].each do |index|

			if board.board[index] == "_"
				move = index 
				break
			end
		end

		move
	end

	def empty_side(board)

		move = -1

		[1,3,5,7].each do |index|

			if board.board[index] = "_"
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