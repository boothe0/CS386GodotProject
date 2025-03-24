extends Node2D
func _ready() -> void:
	InputMap.action_erase_events("attack")
	InputMap.action_erase_events("ranged_attack")
