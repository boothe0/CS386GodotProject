extends TextureRect
const BASE_HEAL = 2
@onready var player = get_node("/root/MainScene/Player")
@export var potency = 1
var health
var max_health = PlayerVariables.max_health
func _ready():
	await get_tree().create_timer(0.1).timeout  # Small delay
	if player:
		print("SET PLAYER HP")
		health = player.health
		print(health)

func use():
	print("Health:", health, "Max Health:", max_health, "Condition result:", health < max_health)
	# called when the node enters the scene tree for the first time.
	if player and  health < max_health:
		player.heal(BASE_HEAL * potency)
		print("GET HERE")
		print(self.get_class())
		self.queue_free()
