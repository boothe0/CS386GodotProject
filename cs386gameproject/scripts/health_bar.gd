extends ProgressBar

static var DamageDisplay = preload("res://scenes/display_damage.tscn")

@onready var player: CharacterBody2D = $"../../Player"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	max_value = player.health
	player.health_update.connect(update)
	
func update():
	var display = DamageDisplay.instantiate()
	display.set_data(value - player.health, player.global_position, get_tree().root)
	display.display()
	value = player.health
