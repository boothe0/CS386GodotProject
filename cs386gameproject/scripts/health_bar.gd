extends ProgressBar

static var DamageDisplay = preload("res://scenes/display_damage.tscn")
@onready var player: CharacterBody2D = $"../../Player"


func _ready() -> void:
	# connect player health with ui
	max_value = player.health
	player.health_update.connect(update)
	
func update():
	# call to display damage in game
	var display = DamageDisplay.instantiate()

	# display the player health bar
	display.set_data(value - player.health, player.global_position, get_tree().root)
	display.display()
	value = player.health
