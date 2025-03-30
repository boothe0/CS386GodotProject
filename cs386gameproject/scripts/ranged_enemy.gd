extends CharacterBody2D

# animations
@onready var animated_sprite = $AnimatedSprite2D  

# getting the main scene
@onready var main = get_node("/root/MainScene")

# movement
const SPEED = 50
const ATTACK_COOLDOWN = 1.5
const ATTACK_DAMAGE = 1
const STOP_DISTANCE = 10
var direction = Vector2.ZERO

# desired distance for the ranged enemy (ideally the attack radius)
const DESIRED_DISTANCE = 150
# tolerance range to prevent jitter when close enough to desired distance
const DESIRED_TOLERANCE = 10

# coins
const BRONZE_CHANCE : float = 0.75
const SILVER_CHANCE : float = 0.15
const GOLD_CHANCE : float = 0.05
var coin_scene := preload("res://scenes/coin.tscn")

# Preload the enemy projectile scene for ranged attacks
const enemy_projectile = preload("res://scenes/enemy_projectile.tscn")

# player detection and handling
var player = null
var chasing_player = false
var in_attack_range = false
var can_attack = true

# center objective detection and handling
var target_position := Vector2.ZERO
var center_objective: Node2D = null
var reached_center = false
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D

# health
@export var health = 3
signal health_update

# current target to attack ("player" or "center_objective")
var current_target = "center_objective"

func _ready() -> void:
	# Ensure navigation agent is initialized
	navigation_agent = $NavigationAgent2D if $NavigationAgent2D else null

	# Find the center objective safely
	var center_objectives = get_tree().get_nodes_in_group("center_objective")
	if center_objectives.size() > 0:
		center_objective = center_objectives.front()
	else:
		push_error("No CenterObjective found in the scene!")

	# Only set target if center objective and navigation agent exist
	if center_objective and navigation_agent:
		set_target(center_objective.global_position)
		current_target = "center_objective"

func _physics_process(delta: float) -> void:
	# If center objective has been reached, attack it while remaining stationary
	if reached_center:
		velocity = Vector2.ZERO
		move_and_slide()
		if can_attack:
			attack_target(center_objective)
		return

	# Determine the closest target (player or objective)
	var target = get_closest_target()
	if target:
		if current_target == "player" and in_attack_range and player:
			var current_distance = global_position.distance_to(player.global_position)
			# If we're outside the tolerance zone, update the target position
			if abs(current_distance - DESIRED_DISTANCE) > DESIRED_TOLERANCE:
				var desired_pos = player.global_position + (global_position - player.global_position).normalized() * DESIRED_DISTANCE
				# Update only if the new desired position differs significantly from the current target
				if navigation_agent.target_position.distance_to(desired_pos) > DESIRED_TOLERANCE:
					set_target(desired_pos)
			else:
				# Within tolerance: lock the enemy's position by setting target to its current position.
				set_target(global_position)
				velocity = Vector2.ZERO
		else:
			# For center objective or when player is not in attack range, use normal navigation
			set_target(target.global_position)

	move_towards_target(delta)

	# Play movement animations based on direction
	if animated_sprite:
		if direction.x > 0:
			animated_sprite.play("walk_right")
		elif direction.x < 0:
			animated_sprite.play("walk_left")
		elif direction.y > 0:
			animated_sprite.play("walk_up")
		elif direction.y < 0:
			animated_sprite.play("walk_down")
	
	# Continuously attack the player if they're the current target and in range
	if player and current_target == "player" and in_attack_range and can_attack:
		attack_target(player)

func get_closest_target() -> Node2D:
	""" Returns the closest target (player or objective) """
	if player:
		var dist_to_player = global_position.distance_to(player.global_position)
		var dist_to_objective = global_position.distance_to(center_objective.global_position)
		if dist_to_player < dist_to_objective:
			current_target = "player"
			return player  # Player is closer, chase them
		else:
			current_target = "center_objective"
			return center_objective  # Objective is closer, move to it
	current_target = "center_objective"
	return center_objective  # No player detected, move to the objective

func set_target(target: Vector2):
	if navigation_agent:
		navigation_agent.target_position = target
	else:
		push_error("NavigationAgent2D is null!")

func move_towards_target(delta):
	if navigation_agent and navigation_agent.is_navigation_finished():
		return
		
	var next_position = navigation_agent.get_next_path_position()
	if global_position.distance_to(next_position) < 5:
		velocity = Vector2.ZERO
	else:
		direction = (next_position - global_position).normalized()
		velocity = direction * SPEED 
		
	move_and_slide()

func attack_target(target: Node2D) -> void:
	# Attack the given target if cooldown allows
	if not target or not can_attack:
		return
	var projectile = enemy_projectile.instantiate()
	get_parent().add_child(projectile)
	projectile.global_position = global_position
	projectile.fire(target.global_position)
	can_attack = false
	await get_tree().create_timer(ATTACK_COOLDOWN).timeout
	can_attack = true

func take_damage(amount):
	health -= amount
	health_update.emit()
	if health <= 0:
		die()

func die():
	var coin_drop = randf()
	var coin_amount = randi() % 3 + 1
	if coin_drop <= GOLD_CHANCE:
		drop_coin(2, coin_amount)
	elif coin_drop <= SILVER_CHANCE:
		drop_coin(1, coin_amount)
	elif coin_drop <= BRONZE_CHANCE:
		drop_coin(0, coin_amount)
	queue_free()

func drop_coin(coin_type, coin_amount):
	var offsets = []
	if coin_amount == 1:
		offsets.append(Vector2(0, 0))
	elif coin_amount == 2:
		offsets.append(Vector2(-10, 0))
		offsets.append(Vector2(10, 0))
	elif coin_amount == 3:
		offsets.append(Vector2(0, -10))
		offsets.append(Vector2(-10, 0))
		offsets.append(Vector2(10, 0))
	for offset in offsets:
		var coin = coin_scene.instantiate()
		coin.position = position + offset
		coin.coin_type = coin_type
		main.call_deferred("add_child", coin)
		coin.add_to_group("coins")

# === DETECTION AREA ===
func _on_detection_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player = body
		chasing_player = true  # Now the enemy can consider the player as a target

func _on_detection_area_body_exited(body: Node2D) -> void:
	if body == player:
		player = null  # Stop tracking the player when they leave the area

func _on_attack_area_body_entered(body: Node2D) -> void:
	# Only set the flag; continuous attack is handled in _physics_process.
	if body.name == "Player":
		in_attack_range = true

func _on_attack_area_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		in_attack_range = false
