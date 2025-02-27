extends CharacterBody2D
<<<<<<< HEAD
# onready and export variables at the beginning
=======

# animations
>>>>>>> 71671a3d86790a32c478b9fe1b28c25770710058
@onready var animated_sprite = $AnimatedSprite2D  

# getting the main scene
@onready var main = get_node("/root/MainScene")

# movement
const SPEED = 80
const ATTACK_COOLDOWN = 1.5
const ATTACK_DAMAGE = 1
var direction = Vector2.ZERO

# coins
const BRONZE_CHANCE : float = 0.75
const SILVER_CHANCE : float = 0.15
const GOLD_CHANCE : float = 0.05
var coin_scene := preload("res://scenes/coin.tscn")

# player detection and handling
var player = null
var can_attack = true
var in_attack_range = false

# health
@export var health = 3
signal health_update


func _physics_process(_delta: float) -> void:
	# move is player is detected
	if player:
		direction = (player.global_position - global_position).normalized()
		velocity = direction * SPEED
		move_and_slide()

	# play movement animations based on direction
	if animated_sprite:
		if direction.x > 0:
			animated_sprite.play("walk_right")
		elif direction.x < 0:
			animated_sprite.play("walk_left")
		elif direction.y > 0:
			animated_sprite.play("walk_up")
		elif direction.y < 0:
			animated_sprite.play("walk_down")

func attack():
	# continually attack while player in range
	while in_attack_range and player and can_attack:
		print("Enemy attacks!")  # debugging
		player.take_damage(ATTACK_DAMAGE)
		can_attack = false
<<<<<<< HEAD
		# to check if the tree is gone from dying
		if get_tree() != null:
			await get_tree().create_timer(ATTACK_COOLDOWN).timeout  # Attack cooldown
			can_attack = true 
=======
>>>>>>> 71671a3d86790a32c478b9fe1b28c25770710058

		if get_tree() != null:
			await get_tree().create_timer(ATTACK_COOLDOWN).timeout
			can_attack = true 

func take_damage(amount):
	# taken damage
	health -= amount
	health_update.emit()
	if health <= 0:
		die()

func die():
	# handle coin randomization on death
	var coin_drop = randf()
	var coin_amount = randi() % 3 + 1

	# drop coin based on randomization
	if coin_drop <= GOLD_CHANCE:
		drop_coin(2, coin_amount)
	elif coin_drop <= SILVER_CHANCE:
		drop_coin(1, coin_amount)
	elif coin_drop <= BRONZE_CHANCE:
		drop_coin(0, coin_amount)
	else:
		pass

	queue_free()

func drop_coin(coin_type, coin_amount):
	var offsets = []

	# choose coin position based on amount dropped
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

func _on_detection_area_body_entered(body: Node2D) -> void:
	# follow player
	if body.name == "Player":
		player = body

func _on_detection_area_body_exited(body: Node2D) -> void:
	# stop chasing
	if body == player:
		player = null

func _on_attack_area_body_entered(body: Node2D) -> void:
	# start attacking player
	if body.name == "Player":
		in_attack_range = true
		attack()

func _on_attack_area_body_exited(body: Node2D) -> void:
	# stop attacking player
	if body.name == "Player":
		in_attack_range = false
