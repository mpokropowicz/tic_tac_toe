require_relative "console_game.rb"
require_relative "random_ai.rb"


p1 = RandomPlayer.new("Player1","X")
p2 = RandomPlayer.new("Player2", "O")

game = ConsoleGame.new(p1, p2)
game.greet_text

 while true

 	game.change_player
	print "#{game.current_player} makes his move!\n"
	move = game.current_player.move_pos
	game.make_move(move)
	game.display

	break if game.winner?
 end

 print "#{game.current_player} has won the game!"