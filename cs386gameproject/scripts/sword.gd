extends Node2D

const BASE_DAMAGE = 2
@export var damage_modifier: float = 1.0

var attacking = false  # Prevents multiple attacks at once
var attack_angle = 45  # How much the sword swings
var attack_speed = 0.2  # Speed of the swing

@onready var sprite = $Sprite2D  # Sword sprite
@onready var hitbox = $Area2D  # Sword's hitbox

var current_direction = Vector2.DOWN
var hit_enemies = []

func _ready() -> void:
	hitbox.monitorable = false
	hitbox.monitoring = false
	
func set_sword_direction(direction: Vector2):
	current_direction = direction
	
	if direction == Vector2.RIGHT:
		position = Vector2(1, 5)
		rotation_degrees = -90      # Face right
		z_index = 6
	elif direction == Vector2.LEFT:
		position = Vector2(0, 5)
		rotation_degrees = 0      # Face left
		z_index = 3
	elif direction == Vector2.UP:
		position = Vector2(6, 3)
		rotation_degrees = 0      # Face up
		z_index = 3
	elif direction == Vector2.DOWN:
		position = Vector2(-5, 4)
		rotation_degrees = -150       # Face down
		z_index = 6

func attack():
	if attacking:
		return  # Prevent multiple swings at once
	
	attacking = true
	hit_enemies.clear()
	
	hitbox.monitorable = true
	hitbox.monitoring = true

	var tween = create_tween()
	tween.set_trans(Tween.TRANS_LINEAR)
	tween.set_ease(Tween.EASE_IN_OUT)

	# Determine the correct swing angles
	var start_angle = rotation_degrees
	var end_angle = 0  # Default value, will be changed

	if current_direction == Vector2.RIGHT:
		end_angle = 60
	elif current_direction == Vector2.LEFT:
		end_angle = -150
	elif current_direction == Vector2.DOWN:
		end_angle = -290
	elif current_direction == Vector2.UP:
		end_angle = -90

	# Swing forward
	tween.tween_property(self, "rotation_degrees", end_angle, attack_speed)
	await tween.finished  # Ensure we wait for the full forward swing

	# Swing back
	tween = create_tween()
	tween.tween_property(self, "rotation_degrees", start_angle, attack_speed)
	await tween.finished  # Ensure we wait for the return swing

	attacking = false
	hide()  # Hide sword after attack
	
	hitbox.monitorable = false
	hitbox.monitoring = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies") and body not in hit_enemies:
		hit_enemies.append(body)
		body.take_damage(BASE_DAMAGE * damage_modifier)
