extends CharacterBody2D
# health, stamina, mana
const BASE_SPEED = 150
const BASE_HEALTH = 5
@export var max_health = BASE_HEALTH
@export var MAX_STAMINA = 10
@export var MAX_MANA = 10
@export var health = max_health
@export var stamina = MAX_STAMINA
@export var mana = MAX_MANA

@export var cumulative_coin_total: int = 0

@export var dodge_cost = 3
@export var dash_speed = 20
@export var friction = .5


# damage taken, death functions
func take_damage(amount):
	# handle damage taken
	health -= amount
	print("Player health: ", health) # debugging
	if health <= 0:
		die()

func die():
	print("Player died")

# healing functions
func heal(amount):
	if health >= max_health:
		print("Health is already full!") # debugging
		return
	
	health = min(health + amount, max_health)
