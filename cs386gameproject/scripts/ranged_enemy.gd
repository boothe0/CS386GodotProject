extends CharacterBody2D

# animations
@onready var animated_sprite = $AnimatedSprite2D  

# getting the main scene
@onready var main = get_node("/root/MainScene")

# movement
const SPEED = 50
const BASE_ATTACK_COOLDOWN = 1.5
const BASE_ATTACK_DAMAGE = 1
const BASE_HEALTH = 3
const STOP_DISTANCE = 10
var direction = Vector2.ZERO

# desired distance for the ranged enemy (ideally the attack radius)
@onready var attack_area_radius = $AttackArea/CollisionShape2D.shape.radius
var DESIRED_DISTANCE = 0
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

var max_health = BASE_HEALTH
@export var health = max_health
var attack_cooldown = BASE_ATTACK_COOLDOWN
var attack_damage = BASE_ATTACK_DAMAGE
signal health_update

# current target to attack ("player" or "center_objective")
var current_target = "center_objective"

# knockback
var is_knocked_back = false
var knockback_duration = 0.2
var knockback_timer = 0.0

# retargeting cooldown
var retarget_timer = 0.0
const RETARGET_COOLDOWN = 0.2

func _ready() -> void:
	_apply_scaling()
	DESIRED_DISTANCE = attack_area_radius
	navigation_agent = $NavigationAgent2D if $NavigationAgent2D else null
	var center_objectives = get_tree().get_nodes_in_group("center_objective")
	if center_objectives.size() > 0:
		center_objective = center_objectives.front()
	else:
		push_error("No CenterObjective found in the scene!")
	if center_objective and navigation_agent:
		set_target(center_objective.global_position)
		current_target = "center_objective"

func _apply_scaling():
	attack_damage += int(0.34 * PlayerVariables.rounds)
	attack_cooldown -= 0.2 * PlayerVariables.rounds  # shoot faster

func _physics_process(delta: float) -> void:
	if is_knocked_back:
		knockback_timer -= delta
		if knockback_timer <= 0:
			is_knocked_back = false
		move_and_slide()
		return

	if reached_center:
		velocity = Vector2.ZERO
		move_and_slide()
		if can_attack:
			attack_target(center_objective)
		return

	retarget_timer -= delta
	var target = get_closest_target()
	if target and retarget_timer <= 0:
		retarget_timer = RETARGET_COOLDOWN

		if current_target == "player" and in_attack_range and player:
			var current_distance = global_position.distance_to(player.global_position)
			var upper_limit = DESIRED_DISTANCE + DESIRED_TOLERANCE
			var lower_limit = DESIRED_DISTANCE - DESIRED_TOLERANCE

			if current_distance > upper_limit:
				# Too far: move in
				var desired_pos = player.global_position + (global_position - player.global_position).normalized() * DESIRED_DISTANCE
				set_target(desired_pos)

			elif current_distance < lower_limit:
				# Too close: move back
				var retreat_direction = (global_position - player.global_position).normalized()
				var retreat_pos = global_position + retreat_direction * 100  # hard retreat vector
				set_target(retreat_pos)

			else:
				# Within comfortable range: stop moving
				set_target(global_position)
				velocity = Vector2.ZERO
		else:
			set_target(target.global_position)

	move_towards_target(delta)

	# Animation
	if animated_sprite:
		if direction.x > 0:
			animated_sprite.play("walk_right")
		elif direction.x < 0:
			animated_sprite.play("walk_left")
		elif direction.y > 0:
			animated_sprite.play("walk_up")
		elif direction.y < 0:
			animated_sprite.play("walk_down")

	# Attack
	if player and current_target == "player" and in_attack_range and can_attack:
		attack_target(player)

func get_closest_target() -> Node2D:
	if player:
		var dist_to_player = global_position.distance_to(player.global_position)
		var dist_to_objective = global_position.distance_to(center_objective.global_position)
		if dist_to_player < dist_to_objective:
			current_target = "player"
			return player
		else:
			current_target = "center_objective"
			return center_objective
	current_target = "center_objective"
	return center_objective

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
	if not target or not can_attack:
		return
	var projectile = enemy_projectile.instantiate()
	get_parent().add_child(projectile)
	projectile.global_position = global_position
	projectile.fire(target.global_position)
	can_attack = false
	await get_tree().create_timer(attack_cooldown).timeout
	can_attack = true

func take_damage(amount, damage_source):
	if damage_source == "sword":
		FreezeManager.frameFreeze(0.1, 0.3)
	health = min(health - amount, max_health)
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
		chasing_player = true

func _on_detection_area_body_exited(body: Node2D) -> void:
	if body == player:
		player = null

func _on_attack_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		in_attack_range = true

func _on_attack_area_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		in_attack_range = false

func apply_knockback(knockback_value: float) -> void:
	var knockback_direction: Vector2 = Vector2.ZERO
	if player:
		knockback_direction = (global_position - player.global_position).normalized()
	else:
		knockback_direction = Vector2(0, -1)
	velocity = knockback_direction * knockback_value
	is_knocked_back = true
	knockback_timer = knockback_duration
