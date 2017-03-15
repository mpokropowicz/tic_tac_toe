class Player

	attr_reader :marker
	attr_accessor :name

	def initialize(name, marker)

		@name = name
		@marker = marker
		@seq_index = -1
	end
	
	def move_pos(board)

	end

	def to_s

		"#{name}, #{marker} "
	end
end