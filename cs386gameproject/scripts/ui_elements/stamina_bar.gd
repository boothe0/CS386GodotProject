extends ProgressBar

@onready var player = $"../../Player"
@onready var regen_timer = $RegenTimer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	max_value = player.stamina
	# calculations for future powerups involving max stam can go here
	value = max_value
	player.dodge_used.connect(func(): value -= player.dodge_cost)
	regen_timer.timeout.connect(func(): value += 1)
	regen_timer.start()
	
