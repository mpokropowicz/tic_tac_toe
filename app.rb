require "sinatra"
require_relative "web_game.rb"
require_relative "random_ai.rb"
require_relative "unbeatable_ai.rb"
require_relative "human.rb"

enable :sessions

get "/" do 

	erb :start
end

get "/game" do 

	session[:p1] = params[:p1] + "1"
	session[:p2] = params[:p2] + "2"

	session[:game] = WebGame.new(session[:p1], session[:p2], 3, 3)

	redirect "/p1"
end

get "/p1" do
	session[:game].change_player

	move = session[:game].current_player.move_pos(session[:game].board)
	session[:game].make_move(move)

	redirect "/winner" if session[:game].winner? || session[:game].board.all_spots_occupied?

	erb :p1
end

get "/p2" do
	session[:game].change_player

	move = session[:game].current_player.move_pos(session[:game].board)
	session[:game].make_move(move)

	redirect "/winner" if session[:game].winner? || session[:game].board.all_spots_occupied?

	erb :p2
end

get "/winner" do

	"you won"
end