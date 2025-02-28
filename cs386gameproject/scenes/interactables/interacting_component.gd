extends Node2D

@onready var interact_label: Label = $InteractLabel
# holds list of all available interactions
var current_interactions := []
var can_interact := true
var scene_instantiate: PackedScene
var instantiated_scene: Node = null
var is_scene_instantiated = false
var label_showing = false
func _ready():
	scene_instantiate = load("res://assets/UI_Elements/shop_screen_ui.tscn")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and can_interact:
		if current_interactions: 
			instantiated_scene = scene_instantiate.instantiate()
			get_parent().add_child(instantiated_scene)
			is_scene_instantiated = true
			can_interact = false
			interact_label.hide()
			await current_interactions[0].interact.call()
			can_interact = true
	if event.is_action_pressed("escape") and is_scene_instantiated == true:
			instantiated_scene.queue_free()
			is_scene_instantiated = false
		
func _process(_delta: float) -> void:
	var i = 0
	if current_interactions and can_interact:
		# returns T or F if an object should be in front or behind in the array
		current_interactions.sort_custom(_sort_by_nearest)
		if current_interactions[0].is_interactable:
			interact_label.text   = current_interactions[0].interact_name
			interact_label.show()
	else:
		interact_label.hide()
		
func _sort_by_nearest(area1, area2):
	var area1_dist = global_position.distance_to(area1.global_position)
	var area2_dist = global_position.distance_to(area2.global_position)
	return area1_dist < area2_dist

func _on_interacting_range_area_entered(area: Area2D) -> void:
	current_interactions.push_back(area)

func _on_interacting_range_area_exited(area: Area2D) -> void:
	# deregistering an interactable area
	current_interactions.erase(area)
