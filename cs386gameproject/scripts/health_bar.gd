extends ProgressBar

static var DamageDisplay = preload("res://scenes/display_damage.tscn")
@onready var player = get_node("/root/MainScene/Player")

var health = PlayerVariables.health

func _ready():

	if player:
		max_value = health
		player.health_update.connect(update)
	else:
		print("Player instance is null!")

func update():
	# call to display damage in game
	var display = DamageDisplay.instantiate()

	# display the player health bar
	display.set_data(value - player.health, player.global_position, get_tree().root)
	display.display()
	value = player.health
