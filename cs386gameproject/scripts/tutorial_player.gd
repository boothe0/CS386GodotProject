extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

const BASE_SPEED = 150

enum WeaponType {SWORD, PROJECTILE}
var current_weapon = WeaponType.SWORD
var last_attack_direction = Vector2.DOWN 
var weapon_animation_done = true
var projectile_scene = preload("res://scenes/projectile.tscn")
@onready var sword: Node2D = $Sword

# movement, dash and dodge
var last_direction = Vector2.DOWN 
var last_movement_direction = Vector2.DOWN
var dash_direction = Vector2()
@export var dodge_cost = 3
@export var dash_speed = 20
@export var friction = .5

@onready var heal_potion: Node2D = $HealPotion

# Signals
signal dodge_used


func _ready():
	sword.hide()

	Emitter.player_variables_updated.connect(load_upgrades)

	load_upgrades()

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
		emit_used_dodge_signal()

		dash_direction = direction.normalized()
		velocity = dash_direction * dash_speed
		velocity += Vector2(1.0 - (friction * _delta), 1.0 - (friction * _delta))
		move_and_collide(velocity)
		
	if Input.is_action_just_pressed("debug"): ## TEST UPGRADE
		PlayerVariables.sword_scale *= 2
		PlayerVariables.health_scale += 0.5
		Emitter.emit_signal("player_variables_updated")

func load_upgrades() -> void:
	sword.scale = sword.BASE_SIZE * PlayerVariables.sword_scale

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

	# handle projectile logic
	var projectile = projectile_scene.instantiate()
	get_parent().add_child(projectile)
	projectile.global_position = global_position
	projectile.set_direction(get_global_mouse_position(), global_position)

func swing_sword():
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


func use_heal_potion():
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
