require_relative "console_game.rb"
require_relative "random_ai.rb"
require_relative "sequential_ai.rb"
require_relative "human.rb"
require_relative "unbeatable_ai.rb"


p1 = HumanPlayer.new("Player1","X")
#p2 = RandomPlayer.new("Player2", "O")
p2 = UnbeatablePlayer.new("Player2", "O")
#p2 = SequentialPlayer.new("Player2", "O")

game = ConsoleGame.new(p1, p2, 3, 3)
game.greet_text

 while true

 	game.change_player
	print "#{game.current_player} makes his move!\n"

	move = game.current_player.move_pos(game.board)

	game.make_move(move)
	game.display

	break if game.winner? || game.board.all_spots_occupied?
 end

if !game.winner? && game.board.all_spots_occupied?

	print "The game is a tie! Oh the humanity!"
else
	print "#{game.current_player} has won the game!"
end