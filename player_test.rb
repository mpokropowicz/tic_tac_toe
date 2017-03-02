require "minitest/autorun"
require_relative "player.rb"

class TestPlayer < Minitest::Test 

	def test_name

		player = Player.new("Max", "O")

		assert_equal("Max", player.name)
	end

	def test_marker

		player = Player.new("Max", "X")

		assert_equal("X", player.marker)
	end

	def test
end