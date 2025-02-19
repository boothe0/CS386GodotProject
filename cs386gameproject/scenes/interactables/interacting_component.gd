extends Node2D

@onready var interact_label: Label = $InteractLabel
# holds list of all available interactions
var current_interactions := []
var can_interact := true

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and can_interact:
		if current_interactions:
			can_interact = false
			interact_label.hide()
			
			await current_interactions[0].interact.call()

			can_interact = true

func _process(_delta: float) -> void:
	if current_interactions and can_interact:
		if current_interactions[0].is_interactable:
			interact_label.text = current_interactions[0].interact_name
			interact_label.show()
	else:
		interact_label.hide()
		
func _on_interacting_range_area_entered(area: Area2D) -> void:
	current_interactions.push_back(area)

func _on_interacting_range_area_exited(area: Area2D) -> void:
	# deregistering an interactable area
	current_interactions.erase(area)
