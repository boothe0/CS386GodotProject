extends Node2D
@onready var coins_to_buy: Label = $Player/coins_to_buy
var player_ui = load("res://assets/UI_Elements/player_ui.tscn")

func _ready() -> void:
	var ui_scene = player_ui.instantiate()
	add_child(ui_scene)
