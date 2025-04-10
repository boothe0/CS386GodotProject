extends GutTest
@onready var player_script = load("res://tests/test_scripts/player.gd")
@onready var player = player_script.new()
@onready var player_max_hp = player.health

func test_take_damage():
	var damages = [
		-999999592634052485,
		-90524, 
		-2,
		0,
		4,
		654,
		1885,
		1389374685102513
	]
	for damage in damages:
		player.take_damage(damage)
		assert_eq(player_max_hp - damage, player.health, "Unexpected HP total")
		assert_lte(player.health, player_max_hp, "Player HP greater than max")
		player.health = player_max_hp
		

func test_heal_():
	player.health -= 10
	var health = player.health
	var heal_amount = 5
	var expected = health + heal_amount
	player.heal(5)
	assert_eq(player.health, expected, "Unexpected heal amount")
	assert_lte(player.health, player_max_hp, "Health above maximum!")
