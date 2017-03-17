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

	session[:p1human] = session[:game].p1.class == HumanPlayer ? "text" : "hidden"
	session[:p2human] = session[:game].p2.class == HumanPlayer ? "text" : "hidden"

	redirect "/p1"
end

get "/p1" do
	session[:game].change_player

	redirect "/p1human" if session[:game].p1.class == HumanPlayer

	move = session[:game].current_player.move_pos(session[:game].board)

	session[:game].make_move(move)

	redirect "/winner" if session[:game].winner? || session[:game].board.all_spots_occupied?

	erb :p1
end

get "/p1human" do

	erb :p1
end

post "/p1human" do

	move = session[:game].current_player.move_pos_web(session[:game].board, params[:p1humanmove].to_i) - 1
	session[:game].make_move(move)

	redirect "/winner" if session[:game].winner? || session[:game].board.all_spots_occupied?

	redirect "/p2"
end

get "/p2" do
	session[:game].change_player

	redirect "/p2human" if session[:game].p2.class == HumanPlayer

	move = session[:game].current_player.move_pos(session[:game].board)
	session[:game].make_move(move)

	redirect "/winner" if session[:game].winner? || session[:game].board.all_spots_occupied?

	erb :p2
end

get "/p2human" do

	erb :p2
end

post "/p2human" do

	move = session[:game].current_player.move_pos_web(session[:game].board, params[:p2humanmove].to_i) - 1
	session[:game].make_move(move)

	redirect "/winner" if session[:game].winner? || session[:game].board.all_spots_occupied?

	redirect "/p1"
end

get "/winner" do

	"tie" if session[:game].board.all_spots_occupied?
	"you won" if session[:game].winner?
end