extends Node2D

var TutorialStage = 0

@onready var TutorialTimer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	TutorialTimer.start()

func _on_timer_timeout() -> void:
	if TutorialStage == 0:
		$CanvasLayer/Control/RichTextLabel.text = "Press 'e' to make a melee attack"
		TutorialStage = 1
		TutorialTimer.start()
	elif TutorialStage == 1:
		$CanvasLayer/Control/RichTextLabel.text = "Right click to make a ranged attack"
		TutorialStage = 2
		TutorialTimer.start()
	elif TutorialStage == 2:
		$CanvasLayer/Control/RichTextLabel.text = "Press the space bar to dodge"
		TutorialStage = 3
		TutorialTimer.start()
	elif TutorialStage == 3:
		$CanvasLayer/Control/RichTextLabel.text = "Press 'f' to use a potion"
		TutorialStage = 4
		TutorialTimer.start()
	elif TutorialStage == 4:
		$CanvasLayer/Control/RichTextLabel.text = "Press 'e' to interact with shop items"
		TutorialStage = 5
		TutorialTimer.start()
	elif TutorialStage == 5:
		$CanvasLayer/Control/RichTextLabel.text = "Use arrow keys to move"
		TutorialStage = 0
		TutorialTimer.start()

func _on_return_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")
