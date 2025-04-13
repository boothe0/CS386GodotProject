extends Node
@export var BASE_HEALTH = 3
@export var health = BASE_HEALTH
@export var dead = false

func take_damage(amount, damage_source):
	if damage_source == "sword":
		FreezeManager.frameFreeze(0.1, 0.3)
	health -= amount
	if health <= 0:
		dead = true
		die()

func die():
	var coin_drop = randf()
	var coin_amount = randi() % 3 + 1
