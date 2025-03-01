extends CharacterBody2D

# animations
@onready var animated_sprite = $AnimatedSprite2D  

# getting the main scene
@onready var main = get_node("/root/MainScene")

# movement
const SPEED = 80
const ATTACK_COOLDOWN = 1.5
const ATTACK_DAMAGE = 1
const STOP_DISTANCE = 10
var direction = Vector2.ZERO

# coins
const BRONZE_CHANCE : float = 0.75
const SILVER_CHANCE : float = 0.15
const GOLD_CHANCE : float = 0.05
var coin_scene := preload("res://scenes/coin.tscn")

# player detection and handling
var player = null
var chasing_player = false
var can_attack = true
var in_attack_range = false

# center objective detection and handling
var target_position := Vector2.ZERO
var center_objective: Node2D = null
var reached_center = false
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D

# health
@export var health = 3
signal health_update

# current target to attack
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
	# If center objective has been reached, stop moving permanently
	if reached_center:
		velocity = Vector2.ZERO
		move_and_slide()
		return

	# Determine the closest target (player or objective)
	var target = get_closest_target()
	if target:
		set_target(target.global_position)

	move_towards_target(delta)

	# If the enemy reaches the center objective, lock them there
	if center_objective and global_position.distance_to(center_objective.global_position) < STOP_DISTANCE:
		reached_center = true
		velocity = Vector2.ZERO
		current_target = "center_objective"
		move_and_slide()

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

func attack():
	# Continually attack while player in range
	while in_attack_range and player and can_attack:
		player.take_damage(ATTACK_DAMAGE)
		can_attack = false

		if get_tree() != null:
			await get_tree().create_timer(ATTACK_COOLDOWN).timeout
			can_attack = true 

func take_damage(amount):
	# Taken damage
	health -= amount
	health_update.emit()
	if health <= 0:
		die()

func die():
	# Handle coin randomization on death
	var coin_drop = randf()
	var coin_amount = randi() % 3 + 1

	# Drop coin based on randomization
	if coin_drop <= GOLD_CHANCE:
		drop_coin(2, coin_amount)
	elif coin_drop <= SILVER_CHANCE:
		drop_coin(1, coin_amount)
	elif coin_drop <= BRONZE_CHANCE:
		drop_coin(0, coin_amount)

	queue_free()

func drop_coin(coin_type, coin_amount):
	var offsets = []

	# Choose coin position based on amount dropped
	if coin_amount == 1:
		offsets.append(Vector2(0,0))
	elif coin_amount == 2:
		offsets.append(Vector2(-10,0))
		offsets.append(Vector2(10,0))
	elif coin_amount == 3:
		offsets.append(Vector2(0,-10))
		offsets.append(Vector2(-10,0))
		offsets.append(Vector2(10,0))

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
		chasing_player = true  # Enemy will now consider the player as a possible target

func _on_detection_area_body_exited(body: Node2D) -> void:
	if body == player:
		player = null  # Remove player reference so it stops being a potential target

func _on_attack_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		in_attack_range = true
		attack()

func _on_attack_area_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		in_attack_range = false
