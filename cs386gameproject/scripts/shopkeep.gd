extends Node
@onready var label = $InteractLabel
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.visible = false
	label.text = "Next Round Press E"
	
func _input(event):
	if event.is_action_pressed("interact") and label.visible:
		_bind_key_helper("attack", KEY_E)
		_bind_key_helper("attack", MOUSE_BUTTON_LEFT)
		_bind_key_helper("ranged_attack", MOUSE_BUTTON_RIGHT)
		get_tree().change_scene_to_file("res://scenes/main_scene.tscn")

func _bind_key_helper(action_name, input_code):
	var input_event
	
	if input_code >= KEY_SPACE:  # Key codes start from KEY_SPACE and above
		input_event = InputEventKey.new()
		input_event.keycode = input_code
	else:  # Mouse buttons are below KEY_SPACE in keycode values
		input_event = InputEventMouseButton.new()
		input_event.button_index = input_code
	InputMap.action_add_event(action_name, input_event)

func _on_interacting_range_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		label.visible = true

func _on_interacting_range_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		label.visible = false
