extends ProgressBar

@export var player: CharacterBody2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	max_value = player.health
	player.health_update.connect(update)
	
func update():
	value = player.health
