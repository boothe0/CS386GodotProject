extends Node2D

var current_direction = Vector2.DOWN
var using_heal_potion = false
var rotation_angle = 50
var use_speed = 0.2
@onready var sprite: Sprite2D = $Sprite2D


func _ready() -> void:
	# start potion hidden
	hide()

func set_potion_direction(direction: Vector2):
	current_direction = direction

	# default positioning and rotation
	if direction == Vector2.RIGHT:
		position = Vector2(5, 3)
		rotation_degrees = 0
		sprite.flip_h = false
		z_index = 0
	elif direction == Vector2.LEFT:
		position = Vector2(-5, 3)
		rotation_degrees = 0
		sprite.flip_h = true
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
		z_index = -2

	print("Potion direction set to:", current_direction, "Position:", position,
			 "Rotation:", rotation_degrees, "Z-Index:", z_index)  # debugging

func use_heal_potion():
	# prevent multiple uses
	if using_heal_potion:
		return  
	
	using_heal_potion = true
	print("Using potion")  # debugging

	# make the potion visible
	show() 

	var tween = create_tween()
	tween.set_trans(Tween.TRANS_LINEAR)
	tween.set_ease(Tween.EASE_IN_OUT)

	# determine the final rotation based on direction
	var end_angle = -rotation_angle if current_direction == Vector2.RIGHT or current_direction == Vector2.DOWN else rotation_angle

	# animate potion use
	tween.tween_property(self, "rotation_degrees", end_angle, use_speed)
	await tween.finished

	# return to initial position
	tween = create_tween()
	tween.tween_property(self, "rotation_degrees", 0, use_speed)
	await tween.finished

	# heal the player
	if get_parent().has_method("heal"):
		get_parent().heal(1) 

	# hide potion after use
	using_heal_potion = false
	hide()  

	print("Potion use finished")  # debugging
