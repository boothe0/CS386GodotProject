extends CharacterBody2D

const SPEED = 80
var player = null
var direction = Vector2.ZERO
var health = 3
var attack_damage = 1
var can_attack = true

@onready var animated_sprite = $AnimatedSprite2D  # If using animations

# code to move enemy and play animations
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

# code to let enemy attack player when in range
func attack():
	while player and can_attack:
		print("Enenmy attacks!")
		player.take_damage(attack_damage)
		can_attack = false
		await get_tree().create_timer(1.5).timeout
		can_attack = true 

# code for enemy to take damage from player
func take_damage(amount):
	health -= amount
	print("Enemy health: ", health) #debugging
	if health <= 0:
		die()
		
# code to have enemy die once all health is gone
func die():
	queue_free()

# code to follow player if enters detection zone
func _on_detection_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player = body

#code to stop following player once they leave detection zone
func _on_detection_area_body_exited(body: Node2D) -> void:
	if body == player:
		player = null

# attack when player enters area
func _on_attack_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player = body
		attack()
		
# stop attacking when player leaves area
func _on_attack_area_body_exited(body: Node2D) -> void:
	if body == player:
		player = null
