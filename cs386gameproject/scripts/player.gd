extends CharacterBody2D

#player animations
@onready var animated_sprite = $AnimatedSprite2D

# health, stamina, mana
const BASE_SPEED = 150
const BASE_HEALTH = 5
@export var max_health = BASE_HEALTH
@export var MAX_STAMINA = 10
@export var MAX_MANA = 10
@export var MAX_SHIELD = 3
@export var health = max_health
@export var stamina = MAX_STAMINA
@export var mana = MAX_MANA
@export var shield = MAX_SHIELD
@onready var spacebar_text = $"../PlayerUI/StaminaBar/SpaceBarIndicator"
@onready var stamina_bar = $"../PlayerUI/StaminaBar"

# weapons and weapon logic
enum WeaponType {SWORD, PROJECTILE}
var current_weapon = WeaponType.SWORD
var last_attack_direction = Vector2.DOWN 
var weapon_animation_done = true
var projectile_scene = preload("res://scenes/projectile.tscn")
@onready var sword: Node2D = $Sword

# coins and coin logic
const bronze_texture = preload("res://assets/bronze-coin.png")
const gold_texture = preload("res://assets/gold-coin.png")
const silver_texture = preload("res://assets/silver-coin.png")
var coin_popup_accumulator: int = 0
@onready var total_coins: Label = $"../PlayerUI/Coins/HBoxContainer/TotalCoins"
@onready var coins_added: Label = $"../PlayerUI/Coins/CoinsAdded"
@onready var coin_timer: Timer = $CoinTimer
@onready var last_coin: TextureRect = $"../PlayerUI/Coins/HBoxContainer/LastCoin"
@export var cumulative_coin_total: int = 0

# movement, dash and dodge
var last_direction = Vector2.DOWN 
var last_movement_direction = Vector2.DOWN
var dash_direction = Vector2()
@export var dodge_cost = 3
@export var dash_speed = 20
@export var friction = .5

# misc (for now)
@onready var player_variables = $"../PlayerVariables"
@onready var heal_potion: Node2D = $HealPotion

# Signals
signal health_update
signal stamina_update
signal mana_update
signal dodge_used
signal shield_update

func _ready():
	health_update.emit()
	sword.hide()

	Emitter.player_variables_updated.connect(load_user_variables)

	if coins_added != null:
		coins_added.visible = false
		
	load_user_variables()

func _physics_process(_delta):
	# handle player movement
	var direction = Vector2.ZERO

	if Input.is_action_pressed("move_right"):
		direction.x += 1
	elif Input.is_action_pressed("move_left"):
		direction.x -= 1

	if Input.is_action_pressed("move_down"):
		direction.y += 1
	elif Input.is_action_pressed("move_up"):
		direction.y -= 1

	if direction.length() > 0:
		last_movement_direction = direction.normalized()
		velocity = direction.normalized() * BASE_SPEED
		move_and_slide()

	update_movement_animation()

	# handle potion use
	if Input.is_action_just_pressed("use_potion"):
		use_heal_potion()

	if Input.is_action_just_pressed("use_potion_1"):
		Emitter.emit_signal("consumable_1")

	if Input.is_action_just_pressed("use_potion_2"):
		Emitter.emit_signal("consumable_2")

	if Input.is_action_just_pressed("use_potion_3"):
		Emitter.emit_signal("consumable_3")

	# handle attacking
	if Input.is_action_just_pressed("attack"):
		swing_sword()
		weapon_animation_done = true

	if Input.is_action_just_pressed("ranged_attack") and weapon_animation_done != false:
		shoot()

	# handle dodging
	if Input.is_action_just_pressed("dodge"):
		if stamina_bar == null:
			print("cannot dash here") # debugging
			return  
		elif stamina_bar.value < dodge_cost:
			return

		emit_used_dodge_signal()

		dash_direction = direction.normalized()
		velocity = dash_direction * dash_speed
		velocity += Vector2(1.0 - (friction * _delta), 1.0 - (friction * _delta))
		move_and_collide(velocity)
		
	if Input.is_action_just_pressed("debug"): ## TEST UPGRADE
		PlayerVariables.sword_scale *= 2
		PlayerVariables.health_scale += 0.5
		Emitter.emit_signal("player_variables_updated")

func load_user_variables() -> void:
	health = BASE_HEALTH * PlayerVariables.health_scale
	sword.scale = sword.BASE_SIZE * PlayerVariables.sword_scale
	sword.damage_modifier = PlayerVariables.sword_damage_modifier
	cumulative_coin_total = PlayerVariables.coins
	update_total_coin_label()

# movement, idle and dodge functions
func get_idle_animation(direction: Vector2) -> String:
	# handle idle animations
	if direction == Vector2.RIGHT:
		return "idle_right"
	elif direction == Vector2.LEFT:
		return "idle_left"
	elif direction == Vector2.UP:
		return "idle_up"
	elif direction == Vector2.DOWN:
		return "idle_down"
	return "idle_down"

func update_movement_animation():
	# interrupt movement animation if attacking with sword
	if sword.attacking:
		return

	# handle movement animations
	if last_movement_direction == Vector2.RIGHT:
		animated_sprite.play("walk_right")
	elif last_movement_direction == Vector2.LEFT:
		animated_sprite.play("walk_left")
	elif last_movement_direction == Vector2.UP:
		animated_sprite.play("walk_up")
	elif last_movement_direction == Vector2.DOWN:
		animated_sprite.play("walk_down")

func emit_used_dodge_signal():
	dodge_used.emit()

# attack functions
func shoot():
	# handle mana logic
	const mana_cost = 2
	if mana_cost > mana:
		return false

	mana -= mana_cost
	mana_update.emit()

	# handle projectile logic
	var projectile = projectile_scene.instantiate()
	get_parent().add_child(projectile)
	projectile.global_position = global_position
	projectile.set_direction(get_global_mouse_position(), global_position)
	return true

func swing_sword():
	# handle stamina logic
	const stamina_cost = 2
	if stamina < stamina_cost:
		return

	stamina -= stamina_cost
	stamina_update.emit()

	# handle sword attack logic
	weapon_animation_done = false

	update_attack_direction()
	var attack_animation = get_idle_animation(last_attack_direction)
	animated_sprite.play(attack_animation)

	sword.show()
	sword.set_sword_direction(last_attack_direction)
	await sword.attack()

	update_movement_animation()

func update_attack_direction():
	# handle attack direction based on mouse location
	var mouse_pos = get_global_mouse_position()
	var angle = (mouse_pos - global_position).angle()

	if abs(angle) < PI / 4:
		last_attack_direction = Vector2.RIGHT
	elif abs(angle) > 3 * PI / 4:
		last_attack_direction = Vector2.LEFT
	elif angle < 0:
		last_attack_direction = Vector2.UP
	else:
		last_attack_direction = Vector2.DOWN

# damage taken, death functions
func take_damage(amount):
	if shield > 0:
		# Absorb damage with shield first
		var damage_to_shield = min(amount, shield)
		shield -= damage_to_shield
		shield_update.emit()
		amount -= damage_to_shield

	# If there's any remaining damage, apply it to health
	if amount > 0:
		health -= amount
		health_update.emit()
		print("Player health: ", health) # debugging
		if health <= 0:
			die()

func die():
	# handle death
	print("Player died") # debugging
	queue_free()
	get_tree().change_scene_to_file("res://scenes/death.tscn")

# healing functions
func heal(amount):
	# handle healing
	if health >= max_health:
		print("Health is already full!") # debugging
		return

	# prevents from being healed over max health
	health = min(health + amount, max_health)
	health_update.emit()

func use_heal_potion():
	# If already at max health, don't use the potion
	if health >= max_health:
		print("Health is full! Can't use potion.") # debugging
		return

	# Make the player face the potion direction and lock it
	update_attack_direction()
	var heal_animation = get_idle_animation(last_attack_direction)
	animated_sprite.play(heal_animation)
	print("Using potion in direction:", last_attack_direction)  # debugging

	# Temporarily prevent movement-based animation updates
	# Reuse the same lock system from the sword
	sword.attacking = true  

	# Start potion use and wait until it's fully done
	heal_potion.show()
	heal_potion.set_potion_direction(last_attack_direction)
	await heal_potion.use_heal_potion()

	# Allow movement animations again after potion animation is done
	# Reuse the same lock system from the sword
	sword.attacking = false  

	# After using the potion, return to movement-based facing
	print("Potion use finished, returning to movement animation")  # debugging
	update_movement_animation()

# coin handling functions
func add_coins(amount: int, coin_type: int) -> void:
	# handle coin logic
	PlayerVariables.coins += amount
	cumulative_coin_total += amount
	coin_popup_accumulator += amount
	update_total_coin_label()
	
	# Update and show the temporary coins_added popup.
	coins_added.text = "+" + str(coin_popup_accumulator)
	coins_added.visible = true
	
	# Restart the timer so the popup stays visible as long as coins keep being collected.
	coin_timer.start()
	
	match coin_type:
		0:
			last_coin.texture = bronze_texture
		1:
			last_coin.texture = silver_texture
		2:
			last_coin.texture = gold_texture

func update_total_coin_label() -> void:
	if total_coins:
		total_coins.text = "Total Coins: " + str(cumulative_coin_total)

func _on_coin_timer_timeout() -> void:
	# make coins_added label disappear after not collecting coins
	coin_popup_accumulator = 0
	coins_added.visible = false
