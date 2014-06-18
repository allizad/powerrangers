class Person

	attr_accessor :name
	attr_reader :caffeine_level

	def initialize(name, caffeine_level=200)
		@name = name
		@caffeine_level = caffeine_level
	end

	def caffeine_level
		puts "#{@caffeine_level} mg."
	end

	def run(miles)

		if @caffeine_level > 0
			if miles < 10 && miles > 1
				puts "#{@name.capitalize} has run #{miles} miles."
				@caffeine_level -= (miles * 60)
			elsif miles == 1
				puts "#{@name.capitalize} has run #{miles} mile."
				@caffeine_level -= (miles * 60)
			elsif miles < 0
				puts "#{@name} cannot run negative miles."
			else
				puts "#{@name.capitalize} has run #{miles} miles."
				@caffeine_level -= (miles * 60)
			end
		else
			puts "#{self.name} does not have enough caffeine to run."
		end

		if @caffeine_level < 0
			puts "Caffeine withdrawal. Recaffeinate #{self.name} with #{((@caffeine_level.abs)/95).floor} cups of coffee."
		end

	end

	def scream
		puts "#{@name} says: 'BLEAAAAURAAGGGGHHHHH!!' "
	end

	def drink_coffee(cups)
		@caffeine_level += (cups * 95)
		puts "#{self.name} has a caffeine level of #{@caffeine_level} mg."
		puts "#{self.name} is incapacitated for caffeine overdose." if @caffeine_level > 400
	end

end

class PowerRanger < Person
end

class EvilNinja < Person
end
