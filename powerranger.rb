#included punch module so every class can fight
module Punch
	def punch(punch_strength=10, person_punched)
		puts "#{self.name} has punched #{person_punched.name}."
		#punch depletes energy by punch_strength
		self.strength -= punch_strength
		#punch depletes punchee's caffeine_level
		person_punched.caffeine_level -= (punch_strength*95)
		#person punched screams
		person_punched.scream
		#person punched runs away
		person_punched.run(punch_strength*2)
	end
end

class Person

	attr_accessor :name, :caffeine_level, :all_the_persons, :strength

	$all_the_persons = []

	def initialize(name, strength=50, caffeine_level=200)
		@name = name
		@caffeine_level = caffeine_level
		@strength = strength
		$all_the_persons << self
	end

	include Punch

	def self.all_the_persons
		names = $all_the_persons.map { |p| p.name }
		puts names
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
		puts "#{self.name} OD'ed on caffeine. Incapacitated." if @caffeine_level > 400
	end

end

class PowerRanger < Person

	attr_accessor :strength
	attr_accessor :color

	def initialize(name, caffeine_level=200, strength=500, color="blue")
		super(name, caffeine_level)
		@strength = strength
		@color = color
	end

	include Punch

	def rest(hours)
		@strength += (hours*50)
		puts "#{self.name} has rested #{hours} hours. Strength is now up to #{@strength}."
	end

	def use_megazord(person_megazorded)
		puts "#{self.name} has Megazorded #{person_megazorded.name}."
		#punch depletes energy by punch_strength
		self.strength -= 5000
		#punch depletes punchee's caffeine_level
		person_megazorded.caffeine_level -= (5000*95)
		#person punched screams
		5.times {person_megazorded.scream}
		#person punched runs away
		person_megazorded.run(5000*2)
	end

end

class EvilNinja < Person

	attr_accessor :strength
	attr_accessor :evilness

	def initialize(name, caffeine_level=200, strength=500, evilness=400)
		super(name, caffeine_level)
		@strength = strength
		@evilness = evilness
	end

	include Punch

	def cause_mayhem(person_mayhemed)
		random_number = rand(@evilness)
		$all_the_persons.each do |p|
			if p != person_mayhemed
					p.punch(random_number, person_mayhemed)
			end

		end
	end

end
