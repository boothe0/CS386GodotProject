extends CharacterBody2D

const SPEED = 80
var player = null
var direction = Vector2.ZERO

@onready var animated_sprite = $AnimatedSprite2D  # If using animations

func _physics_process(delta: float) -> void:
	if player:
		direction = (player.global_position - global_position).normalized()
		velocity = direction * SPEED
		move_and_slide()
		
	if animated_sprite:
		if direction.x > 0:
			animated_sprite.play("walk_right")
		elif direction.x < 0:
			animated_sprite.play("walk_left")
		elif direction.y > 0:
			animated_sprite.play("walk_up")
		elif direction.y < 0:
			animated_sprite.play("walk_down")




func _on_detection_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player = body

func _on_detection_area_body_exited(body: Node2D) -> void:
	if body == player:
		player = null
