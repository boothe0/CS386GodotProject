extends GutTest
@onready var enemy_script = load("res://tests/mock_objects/enemy.gd")
@onready var enemy = enemy_script.new()

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
		enemy.take_damage(damage, "")  # no specic damage source
		assert_eq(enemy.BASE_HEALTH - damage, enemy.health, "Unexpected HP total")
		assert_lte(enemy.health, enemy.BASE_HEALTH, "Enemy HP greater than max")
		if enemy.health <= 0:
			assert_eq(enemy.dead, true, "Enemy has not died while at or below 0 hp")
		enemy.health = enemy.BASE_HEALTH
		enemy.dead = false
