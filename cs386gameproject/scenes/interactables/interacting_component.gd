extends Node2D

@onready var interact_label: Label = $InteractLabel
# holds list of all available interactions
var current_interactions := []
# to check if the item is interactable
var can_interact := true
var scene_instantiate: PackedScene
var instantiated_scene: Node = null
# to check if scene is already instantiated to avoid calling it again
var is_scene_instantiated = false
# to hide the label when the player isnt close
var label_showing = false
func _ready():
	scene_instantiate = load("res://assets/UI_Elements/shop_screen_ui.tscn")

func _input(event: InputEvent) -> void:
	# if e is pressed in the interaction zone
	if event.is_action_pressed("interact") and can_interact:
		# and if the array is not empty
		if current_interactions: 
			# and if the scene is not yet instantiated for the menu
			if is_scene_instantiated == false:
				# instantiate the scene
				instantiated_scene = scene_instantiate.instantiate()
				# add as child 
				get_parent().add_child(instantiated_scene)
				# set as instantiated to avoid calling when already instantiated
				is_scene_instantiated = true
				# send signal that interaction was triggered
				await current_interactions[0].interact.call()
				# set to false so interact is not triggered while the menu is open
				can_interact = false
			# makes it so you can only interact once while the menu is open   (not completly sure logically why it works I just found that it did)
			if is_scene_instantiated == true:
				can_interact = true
			# otherwise shortly set the can interact to false

	if event.is_action_pressed("escape") and is_scene_instantiated == true:
			instantiated_scene.queue_free()
			is_scene_instantiated = false
			
func _process(_delta: float) -> void:
	var i = 0
	if current_interactions and can_interact:
		# returns T or F if an object should be in front or behind in the array
		current_interactions.sort_custom(_sort_by_nearest)
		# if the "closest area" is interactable
		if current_interactions[0].is_interactable:
			# show the text 
			interact_label.text = current_interactions[0].interact_name
			interact_label.show()
	else:
		interact_label.hide()
# sorting function
func _sort_by_nearest(area1, area2):
	# get the distance of the first area2d 
	var area1_dist = global_position.distance_to(area1.global_position)
	# gets distance of the second area2d
	var area2_dist = global_position.distance_to(area2.global_position)
	# returns if the first area is closer than the second area T/F value
	return area1_dist < area2_dist

func _on_interacting_range_area_entered(area: Area2D) -> void:
	current_interactions.push_back(area)

func _on_interacting_range_area_exited(area: Area2D) -> void:
	# deregistering an interactable area
	# keeps the array short for optimization reasons
	current_interactions.erase(area)
