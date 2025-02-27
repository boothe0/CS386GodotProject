extends TextureRect
const BASE_HEAL = 2

@onready var Player = get_node("../../../Player")
@export var potency = 1


func use():
	# called when the node enters the scene tree for the first time.
	if Player and  Player.health < Player.MAX_HEALTH:
		Player.heal(BASE_HEAL * potency)
		self.queue_free()
