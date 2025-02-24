extends ProgressBar

static var DamageDisplay = preload("res://scenes/display_damage.tscn")
@onready var enemy = $".."


func _ready() -> void:
	max_value = enemy.health
	enemy.health_update.connect(update)

func update() -> void:
	var display = DamageDisplay.instantiate()
	display.set_data(value - enemy.health, enemy.global_position, get_tree().root)
	display.display()
	value = enemy.health
