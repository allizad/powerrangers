require_relative 'powerranger'

clark_kent = Person.new("Clark")
clark_kent.run(150)
clark_kent.run(1)
clark_kent.caffeine_level
clark_kent.run(-2)
clark_kent.caffeine_level
clark_kent.scream
clark_kent.drink_coffee(162)

pink_one = PowerRanger.new("Alli", 400, 1000, "pink")

pink_one.run(200)
clark_kent.drink_coffee(500)
pink_one.punch(40, clark_kent)
pink_one.rest(15)
pink_one.use_megazord(clark_kent)

clark_kent.drink_coffee(1_000_000)
pink_one.drink_coffee(100)

aiko = EvilNinja.new("Aiko")

aiko.punch(10, pink_one)

EvilNinja.all_the_persons

aiko.cause_mayhem(pink_one)