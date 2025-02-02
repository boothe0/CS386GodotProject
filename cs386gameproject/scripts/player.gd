extends CharacterBody2D

const SPEED = 150
@onready var animated_sprite = $AnimatedSprite2D  # Get the sprite node
var projectile_scene = preload("res://scenes/projectile.tscn")
@export var health = 5
signal health_update

# initialization calls go here
func _ready():
	health_update.emit()

func _physics_process(_delta):
	var direction = Vector2.ZERO

	if Input.is_action_pressed("move_right"):
		direction.x += 1
	elif Input.is_action_pressed("move_left"):
		direction.x -= 1
	
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	elif Input.is_action_pressed("move_up"):
		direction.y -= 1

	# Normalize for consistent diagonal movement speed
	direction = direction.normalized()
	velocity = direction * SPEED
	move_and_slide()

	# Play correct animation (prioritizing horizontal movement)
	if direction.x != 0:
		if direction.x > 0:
			animated_sprite.play("walk_right")
		else:
			animated_sprite.play("walk_left")
	elif direction.y != 0:
		if direction.y > 0:
			animated_sprite.play("walk_down")
		else:
			animated_sprite.play("walk_up")
	else:
		# Play idle animation based on the last movement
		if animated_sprite.animation.begins_with("walk"):
			animated_sprite.play("idle_" + animated_sprite.animation.split("_")[1])

	if Input.is_action_just_pressed("shoot"):
		shoot()
		
func shoot():
	var projectile = projectile_scene.instantiate()
	get_parent().add_child(projectile)
	projectile.global_position = global_position
	projectile.set_direction(get_global_mouse_position(), global_position)

func take_damage(amount):
	health -= amount
	health_update.emit()
	print("Player health: ", health)
	if health <= 0:
		die()
		
func die():
	print("Player died")
	queue_free()
	
