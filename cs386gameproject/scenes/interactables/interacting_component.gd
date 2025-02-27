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
	if event.is_action_pressed("interact") and label_showing == true:
		if not is_scene_instantiated:
			instantiated_scene = scene_instantiate.instantiate()
			get_parent().add_child(instantiated_scene)
			is_scene_instantiated = true
			can_interact = false
			await current_interactions[0].interact.call()
			
	if Input.is_action_just_pressed("escape"):
		if is_scene_instantiated:  
			instantiated_scene.queue_free()
			is_scene_instantiated = false
			can_interact = true 
		if current_interactions:
			interact_label.hide()

func _process(_delta: float) -> void:
	var i = 0
	if current_interactions and can_interact:
		if current_interactions[i].is_interactable:
			interact_label.text = current_interactions[0].interact_name
			interact_label.show()
			label_showing = true
			i += 1 
		else:
			interact_label.hide()
			label_showing = false
	else:
		interact_label.hide()
		
func _on_interacting_range_area_entered(area: Area2D) -> void:
	current_interactions.push_back(area)

func _on_interacting_range_area_exited(area: Area2D) -> void:
	# deregistering an interactable area
	current_interactions.erase(area)
