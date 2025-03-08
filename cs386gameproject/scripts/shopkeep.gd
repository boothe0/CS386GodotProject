extends Node
@onready var label = $InteractLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.visible = false
	label.text = "Next Round Press E"
	
func _input(event):
	if event.is_action_pressed("interact") and label.visible:
		get_tree().change_scene_to_file("res://scenes/main_scene.tscn")

func _on_interacting_range_area_entered(area: Area2D) -> void:
	label.visible = true

func _on_interacting_range_area_exited(area: Area2D) -> void:
	label.visible = false
