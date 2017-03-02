require "minitest/autorun"
require_relative "player.rb"

class TestPlayer < Minitest::Test 

	def test_name

		player = Player.new("Max", "O")

		assert_equal("Max", player.name)
	end
end