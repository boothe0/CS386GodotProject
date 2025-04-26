extends GutTest
@onready var player_script = load("res://tests/mock_objects/player.gd")
@onready var player = player_script.new()
@onready var player_max_hp = player.health

const coin_types = {
	0: "bronze",
	1: "silver",
	2: "gold"
}

func test_add_coins():
	var test_params = [
		[5, 1],
		[10, 2],
		[-1, 2],
		[99999999, 0],
		[0, 2],
		[83, 1],
		[0, 1],
		[0, 0]
	]
	for param in test_params:
		player.add_coins(param[0], param[1])
		assert_eq(player.cumulative_coin_total, PlayerVariables.coins, 
			"player coins and player variable coins unequal")
		assert_eq(player.mock_coin_label["amount"], PlayerVariables.coins,
			"coin label and player variables do not match")
		assert_eq(player.mock_coin_label["texture"], coin_types[param[1]],
			"coin texture mis-match")

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
