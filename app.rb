require "sinatra"
require_relative "console_game.rb"
require_relative "random_ai.rb"
require_relative "unbeatable_ai.rb"
require_relative "human.rb"

get "/" do 

	erb :start
end

get "/test" do 

	test = params[:p1]

	"#{test}"
end