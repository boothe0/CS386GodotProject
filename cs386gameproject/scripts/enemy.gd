extends CharacterBody2D

const SPEED = 80
const ATTACK_COOLDOWN = 1.5
const ATTACK_DAMAGE = 1

var player = null
var direction = Vector2.ZERO
var health = 3
var can_attack = true
var in_attack_range = false  # New variable to track attack range

@onready var animated_sprite = $AnimatedSprite2D  

# Move enemy and play animations
func _physics_process(_delta: float) -> void:
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

# Attack loop, stops when player leaves attack area
func attack():
	while in_attack_range and player and can_attack:  # Only attack if player is still in range
		print("Enemy attacks!")  # Debugging
		player.take_damage(ATTACK_DAMAGE)
		can_attack = false
		await get_tree().create_timer(ATTACK_COOLDOWN).timeout  # Attack cooldown
		can_attack = true 

# Take damage from player
func take_damage(amount):
	health -= amount
	print("Enemy health: ", health)  # Debugging
	if health <= 0:
		die()
		
# Enemy dies if health reaches 0
func die():
	queue_free()

# Start following player if they enter detection zone
func _on_detection_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player = body

# Stop following player if they leave detection zone
func _on_detection_area_body_exited(body: Node2D) -> void:
	if body == player:
		player = null  # Fully stops chasing and attacking

# Start attacking when player enters attack zone
func _on_attack_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		in_attack_range = true  # Player is now inside attack range
		attack()  # Start attacking

# Stop attacking when player leaves attack zone
func _on_attack_area_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		in_attack_range = false  # Stop attack loop when player exits attack range
