require "sinatra"
require_relative "console_game.rb"
require_relative "random_ai.rb"
require_relative "unbeatable_ai.rb"
require_relative "human.rb"

get "/" do 

	erb :start
end

get "/game" do 

	text1 = params[:p1]
	text2 = params[:p2]

	"#{text1}   #{text2}"
end