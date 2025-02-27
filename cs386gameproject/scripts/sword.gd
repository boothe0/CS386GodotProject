extends Node2D

const BASE_DAMAGE = 2

var attacking = false
var attack_angle = 45
var attack_speed = 0.2
var current_direction = Vector2.DOWN
var hit_enemies = []

@export var BASE_SIZE = scale
@onready var sprite = $Sprite2D
@onready var hitbox = $Area2D 
@export var damage_modifier: float = 1.0


func _ready() -> void:
	hitbox.monitorable = false
	hitbox.monitoring = false

func set_sword_direction(direction: Vector2):
	current_direction = direction

	if direction == Vector2.RIGHT:
		position = Vector2(1, 5)
		rotation_degrees = -90
		z_index = 6
	elif direction == Vector2.LEFT:
		position = Vector2(0, 5)
		rotation_degrees = 0
		z_index = 3
	elif direction == Vector2.UP:
		position = Vector2(6, 3)
		rotation_degrees = 0 
		z_index = 3
	elif direction == Vector2.DOWN:
		position = Vector2(-5, 4)
		rotation_degrees = -150
		z_index = 6

func attack():
	# prevents swining more than once at once
	if attacking:
		return

	# start detection for enemies within sword collisionbox
	attacking = true
	hit_enemies.clear()

	hitbox.monitorable = true
	hitbox.monitoring = true

	var tween = create_tween()
	tween.set_trans(Tween.TRANS_LINEAR)
	tween.set_ease(Tween.EASE_IN_OUT)

	# Determine the correct swing angles
	var start_angle = rotation_degrees
	var end_angle = 0

	if current_direction == Vector2.RIGHT:
		end_angle = 60
	elif current_direction == Vector2.LEFT:
		end_angle = -150
	elif current_direction == Vector2.DOWN:
		end_angle = -290
	elif current_direction == Vector2.UP:
		end_angle = -90

	# Swing forward until finished
	tween.tween_property(self, "rotation_degrees", end_angle, attack_speed)
	await tween.finished

	# Swing back until finished
	tween = create_tween()
	tween.tween_property(self, "rotation_degrees", start_angle, attack_speed)
	await tween.finished

	# hide sword when no longer attacking
	attacking = false
	hide()

	hitbox.monitorable = false
	hitbox.monitoring = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	# allow sword to hit enemies
	if body.is_in_group("enemies") and body not in hit_enemies:
		hit_enemies.append(body)
		body.take_damage(BASE_DAMAGE * damage_modifier)
