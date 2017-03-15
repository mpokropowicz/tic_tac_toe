require_relative "console_game.rb"
require_relative "random_ai.rb"
require_relative "sequential_ai.rb"
require_relative "human.rb"
require_relative "unbeatable_ai.rb"

class WebGame < ConsoleGame

	def initialize(p1, p2, w, h)

		@p1 = make_player(p1)
		@p2 = make_player(p2)
		@current_player = @p2

		@board = Board.new(w,h)
	end

	def make_player(player)

		marker = player.include?("1") ? "X" : "O"
		name = player.include?("1") ? "Player 1" : "Player 2"

		case player

			when "human"
				p = HumanPlayer.new(name, marker)
			when "easy"
				p = SequentialPlayer.new(name, maker)
			when "medium"
				p = Random_Player.new(name, marker)
			when "hard"
				p = UnbeatablePlayer.new(name, marker)
		end

		p
	end
end