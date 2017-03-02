require_relative "console_game.rb"
require_relative "random_ai.rb"


p1 = RandomPlayer.new("Player1","X")
p2 = RandomPlayer.new("Player2", "O")

game = ConsoleGame.new(p1, p2)


unless game.winner?

	
end

