class Animal

	def initialize(name, sound)

		@name = name
		@sound = sound
	end

	def return_stuff

		"#{@name}, #{@sound}"
	end

	def change_sound(sound)

		@sound = sound
	end
end

dog = Animal.new("Fido", "Bark")
fox = Animal.new("Tim", "roar")

dog.change_sound("glob")

print dog.return_stuff, fox.return_stuff