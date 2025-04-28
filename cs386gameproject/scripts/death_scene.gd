extends Control
@onready var coins_label = $VBoxContainer/Coins
@onready var rounds_label = $VBoxContainer/Rounds
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	coins_label.text = "Coins you had: %d" % PlayerVariables.coins
	rounds_label.text = "Rounds completed: %d" % PlayerVariables.rounds


func _on_button_pressed() -> void:
	PlayerVariables.set_script(null)
	PlayerVariables.set_script(preload("res://scripts/upgrades/player_variables.gd"))
	get_tree().change_scene_to_file("res://scenes/main_scene.tscn")
	
