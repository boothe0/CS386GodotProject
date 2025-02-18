extends Node2D

var using_heal_potion = false  # Prevents multiple uses at once
var rotation_angle = 50  # How much the potion tilts
var use_speed = 0.2  # Speed of the animation

@onready var sprite: Sprite2D = $Sprite2D

var current_direction = Vector2.DOWN  # Default facing down

func _ready() -> void:
	hide()  # Start hidden

func set_potion_direction(direction: Vector2):
	current_direction = direction

	# Default positioning and rotation
	if direction == Vector2.RIGHT:
		position = Vector2(5, 3)
		rotation_degrees = 0
		sprite.flip_h = false  # Ensure it's not flipped
		z_index = 0
	elif direction == Vector2.LEFT:
		position = Vector2(-5, 3)
		rotation_degrees = 0
		sprite.flip_h = true  # Flip for left
		z_index = 0
	elif direction == Vector2.DOWN:
		position = Vector2(5, 3)
		rotation_degrees = 0
		sprite.flip_h = false
		z_index = 0
	elif direction == Vector2.UP:
		position = Vector2(-5, 3)
		rotation_degrees = 0
		sprite.flip_h = false
		z_index = -2  # ONLY for UP

	print("Potion direction set to:", current_direction, "Position:", position, "Rotation:", rotation_degrees, "Z-Index:", z_index)  # Debugging

func use_heal_potion():
	if using_heal_potion:
		return  # Prevent multiple uses
	
	using_heal_potion = true
	print("Using potion")  # Debug

	show()  # Make the potion visible

	var tween = create_tween()
	tween.set_trans(Tween.TRANS_LINEAR)
	tween.set_ease(Tween.EASE_IN_OUT)

	# Determine the final rotation based on direction
	var end_angle = -rotation_angle if current_direction == Vector2.RIGHT or current_direction == Vector2.DOWN else rotation_angle

	# Animate potion use
	tween.tween_property(self, "rotation_degrees", end_angle, use_speed)
	await tween.finished

	# Return to initial position
	tween = create_tween()
	tween.tween_property(self, "rotation_degrees", 0, use_speed)
	await tween.finished

	# Heal the player
	if get_parent().has_method("heal"):
		get_parent().heal(1)  # Heal 1 health point

	using_heal_potion = false
	hide()  # Hide potion after use

	print("Potion use finished")  # Debug
