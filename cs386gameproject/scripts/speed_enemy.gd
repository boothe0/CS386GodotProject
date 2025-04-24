extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D  
@onready var main = get_node("/root/MainScene")
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D

const SPEED = 120
const ATTACK_COOLDOWN = 1.5
const BASE_ATTACK_DAMAGE = 1
const BASE_HEALTH = 3
var direction = Vector2.ZERO

# Coins
const BRONZE_CHANCE : float = 0.75
const SILVER_CHANCE : float = 0.15
const GOLD_CHANCE : float = 0.05
var coin_scene := preload("res://scenes/coin.tscn")

# Player
var player: Node2D = null
var can_attack = true
var in_attack_range = false

# Health
@export var health = BASE_HEALTH
var attack_damage = BASE_ATTACK_DAMAGE
signal health_update

# Knockback
var is_knocked_back = false
var knockback_duration = 0.2
var knockback_timer = 0.0

func _ready() -> void:
	_apply_scaling()
	player = get_tree().get_first_node_in_group("player")
	if not player:
		push_error("Player not found!")
	if not navigation_agent:
		push_error("Missing NavigationAgent2D!")

func _apply_scaling():
	health += PlayerVariables.rounds
	attack_damage = int(attack_damage + 0.5 * PlayerVariables.rounds)

func _physics_process(delta: float) -> void:
	if is_knocked_back:
		knockback_timer -= delta
		if knockback_timer <= 0:
			is_knocked_back = false
		move_and_slide()
		return

	if player:
		navigation_agent.target_position = player.global_position
		move_towards_target(delta)

	if animated_sprite:
		if direction.x > 0:
			animated_sprite.play("walk_right")
		elif direction.x < 0:
			animated_sprite.play("walk_left")
		elif direction.y > 0:
			animated_sprite.play("walk_up")
		elif direction.y < 0:
			animated_sprite.play("walk_down")

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
	while in_attack_range and player and can_attack:
		player.take_damage(attack_damage)
		can_attack = false
		await get_tree().create_timer(ATTACK_COOLDOWN).timeout
		can_attack = true 

func take_damage(amount, damage_source):
	if damage_source == "sword":
		FreezeManager.frameFreeze(0.1, 0.3)
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

func _on_attack_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		in_attack_range = true
		attack()

func _on_attack_area_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		in_attack_range = false

func apply_knockback(knockback_value: float) -> void:
	var knockback_direction = Vector2(0, -1)
	if player:
		knockback_direction = (global_position - player.global_position).normalized()
	velocity = knockback_direction * knockback_value
	is_knocked_back = true
	knockback_timer = knockback_duration
