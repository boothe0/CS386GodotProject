extends ProgressBar

@onready var enemy = $".."

func _ready() -> void:
	max_value = enemy.health
	enemy.health_update.connect(update)

func update() -> void:
	value = enemy.health
