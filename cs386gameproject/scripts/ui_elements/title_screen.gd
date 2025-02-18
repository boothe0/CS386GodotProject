extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer/VBoxContainer/StartButton.grab_focus()
func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_scene.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()
