extends CanvasLayer

var TutorialStage = 1



@onready var rich_text_label: RichTextLabel = $Control/RichTextLabel
@onready var ui_prompt = $ShopKeeper/InteractingComponent/InteractLabel 


func _on_next_button_pressed() -> void:
	match TutorialStage:
		1:
			rich_text_label.text = "Press 'e' to make a melee attack"
			TutorialStage = 2
		2:
			rich_text_label.text = "Right click to make a ranged attack"
			TutorialStage = 3
		3:
			rich_text_label.text = "Press the space bar to dodge"
			TutorialStage = 4
		4:
			rich_text_label.text = "Press 'z, x or c' to use a consumable"
			TutorialStage = 5
		5:
			rich_text_label.text = "Use arrow keys or wasd to move"
			TutorialStage = 1

func _on_return_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")
