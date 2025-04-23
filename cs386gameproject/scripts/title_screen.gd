extends CanvasLayer


func _ready() -> void:
	# called when the node enters the scene tree for the first time.
	$CanvasLayer/VBoxContainer/StartButton.grab_focus()

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/intro_scene.tscn")
	
func _on_tutorial_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/tutorial.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()
