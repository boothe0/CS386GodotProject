extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer/ContinueButton.grab_focus()

func _on_continue_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_scene.tscn")
