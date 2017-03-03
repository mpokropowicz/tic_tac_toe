class Player

	attr_reader :marker
	attr_accessor :name

	def initialize(name, marker)

		@name = name
		@marker = marker
	end
	
	def to_s

		name
	end
end