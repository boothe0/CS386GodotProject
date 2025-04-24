extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer/ContinueButton.grab_focus()

func _on_continue_button_pressed() -> void:
	PlayerVariables.set_script(null)
	PlayerVariables.set_script(preload("res://scripts/upgrades/player_variables.gd"))
	get_tree().change_scene_to_file("res://scenes/main_scene.tscn")
