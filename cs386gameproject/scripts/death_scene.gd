extends Control
@onready var coins_label = $VBoxContainer/Coins
@onready var rounds_label = $VBoxContainer/Rounds
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	coins_label.text = "Coins you had: %d" % PlayerVariables.coins
	rounds_label.text = "Rounds completed: %d" % PlayerVariables.rounds
