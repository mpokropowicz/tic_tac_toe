require "sinatra"
require_relative "web_game.rb"
require_relative "random_ai.rb"
require_relative "unbeatable_ai.rb"
require_relative "human.rb"

get "/" do 

	erb :start
end

get "/game" do 

	p1 = params[:p1] + "1"
	p2 = params[:p2] + "2"

	game = WebGame.new(p1, p2, 3, 3)

	"#{game.p1}, #{game.p2}"
end