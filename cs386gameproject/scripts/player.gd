extends CharacterBody2D

enum WeaponType {SWORD, PROJECTILE}

@onready var animated_sprite = $AnimatedSprite2D
@onready var swordIcon = $"../PlayerUI/SwordUI"
@onready var boltIcon = $"../PlayerUI/BoltUI"
@export var health = 5
# from the stamina_bar script
@export var dodge_val = 1
# changing the dash_speed will change how far the dash is
@export var dash_speed = 20
@export var friction = .5
@onready var sword: Node2D = $Sword
@onready var dodge_timer = $DodgeTimer
var last_direction = Vector2.DOWN 
var last_movement_direction = Vector2.DOWN
var last_attack_direction = Vector2.DOWN 
var projectile_scene = preload("res://scenes/projectile.tscn")
var can_dodge = true
var current_weapon = WeaponType.SWORD
var dash_direction = Vector2()
@onready var heal_potion: Node2D = $HealPotion

# Constants
const SPEED = 150

# Signals
signal health_update
signal dodge_update
# Initialization
func _ready():
	health_update.emit()
	dodge_update.emit()
	sword.hide()  # Start hiddena
  
func _physics_process(_delta):
	var direction = Vector2.ZERO

	# Detect movement input
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	elif Input.is_action_pressed("move_left"):
		direction.x -= 1

	if Input.is_action_pressed("move_down"):
		direction.y += 1
	elif Input.is_action_pressed("move_up"):
		direction.y -= 1
	# Normalize movement direction
	if direction.length() > 0:
		last_movement_direction = direction.normalized()
		velocity = direction.normalized() * SPEED
		move_and_slide()

	# Update facing direction based on mouse position
	update_movement_animation()

	if Input.is_action_just_pressed("use_potion"):
		use_heal_potion()


	# Handle attack input
	if Input.is_action_just_pressed("attack"):
		if current_weapon == WeaponType.PROJECTILE:
			print("shooting projectile") # Debug
			shoot() 

		elif current_weapon == WeaponType.SWORD:
			print("swinging sword") # Debug
			swing_sword()

	# Handle dodge
	if Input.is_action_just_pressed("dodge") and can_dodge:
		_dodge()
		dash_direction = direction.normalized()
		velocity = dash_direction * dash_speed
		# type cast velocity when combining with any other type other than Vector2
		velocity += Vector2(1.0 - (friction * _delta), 1.0 - (friction * _delta))
		# move and collide not move and slide for this
		move_and_collide(velocity)
		# moves down to the timer block
		$DodgeTimer.start()
func update_movement_animation():
	# If the sword is attacking OR using a potion, don't change facing direction
	if sword.attacking:
		return

	# Otherwise, update facing direction based on movement
	if last_movement_direction == Vector2.RIGHT:
		animated_sprite.play("walk_right")
	elif last_movement_direction == Vector2.LEFT:
		animated_sprite.play("walk_left")
	elif last_movement_direction == Vector2.UP:
		animated_sprite.play("walk_up")
	elif last_movement_direction == Vector2.DOWN:
		animated_sprite.play("walk_down")

# Handle weapon switching
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("switch_sword"):
		current_weapon = WeaponType.SWORD
		print("Switched to Sword") # debug
		swordIcon.visible = true
		boltIcon.visible = false
	elif event.is_action_pressed("switch_projectile"):
		current_weapon = WeaponType.PROJECTILE
		print("Switched to Projectile") # debug
		swordIcon.visible = false
		boltIcon.visible = true

# Handle shooting projectiles
func shoot():
	var projectile = projectile_scene.instantiate()
	get_parent().add_child(projectile)
	projectile.global_position = global_position
	projectile.set_direction(get_global_mouse_position(), global_position)

# Handle sword attack
func swing_sword():
	# Update facing direction to match attack direction and lock it
	update_attack_direction()
	var attack_animation = get_idle_animation(last_attack_direction)
	animated_sprite.play(attack_animation)  # Force player to face attack direction
	print("Swinging sword in direction:", last_attack_direction)  # Debugging
	
	# Start sword attack and wait until it's fully done
	sword.show()
	sword.set_sword_direction(last_attack_direction)  # Set sword to attack direction
	await sword.attack()  # Wait until attack is complete

	# After the attack, return to movement-based facing
	print("Attack finished, returning to movement animation")  # Debug
	update_movement_animation()
		
	
func get_idle_animation(direction: Vector2) -> String:
	if direction == Vector2.RIGHT:
		return "idle_right"
	elif direction == Vector2.LEFT:
		return "idle_left"
	elif direction == Vector2.UP:
		return "idle_up"
	elif direction == Vector2.DOWN:
		return "idle_down"
	return "idle_down"  # Default fallback

func update_attack_direction():
	var mouse_pos = get_global_mouse_position()
	var angle = (mouse_pos - global_position).angle()

	# Convert angle into a direction (Up, Down, Left, Right)
	if abs(angle) < PI / 4:  # Right
		last_attack_direction = Vector2.RIGHT
	elif abs(angle) > 3 * PI / 4:  # Left
		last_attack_direction = Vector2.LEFT
	elif angle < 0:  # Up
		last_attack_direction = Vector2.UP
	else:  # Down
		last_attack_direction = Vector2.DOWN

# Handle player taking damage
func take_damage(amount):
	health -= amount
	health_update.emit()
	print("Player health: ", health)
	if health <= 0:
		die()

func die():
	print("Player died")
	queue_free()


	
func heal(amount):
	if health >= 5:
		print("Health is already full!")  # Debug
		return  # Prevent overhealing

	health = min(health + amount, 5)  # Prevent health from exceeding 5
	health_update.emit()
	print("Player healed: ", health)

func use_heal_potion():
	# If already at max health, don't use the potion
	if health >= 5:
		print("Health is full! Can't use potion.")
		return

	# Make the player face the potion direction and lock it
	update_attack_direction()
	var heal_animation = get_idle_animation(last_attack_direction)
	animated_sprite.play(heal_animation)  # Lock player facing direction
	print("Using potion in direction:", last_attack_direction)  # Debugging

	# Temporarily prevent movement-based animation updates
	sword.attacking = true  # Reuse the same lock system from the sword

	# Start potion use and wait until it's fully done
	heal_potion.show()
	heal_potion.set_potion_direction(last_attack_direction)  # Set potion direction
	await heal_potion.use_heal_potion()  # Wait for potion animation to finish

	# Allow movement animations again after potion animation is done
	sword.attacking = false  

	# After using the potion, return to movement-based facing
	print("Potion use finished, returning to movement animation")  # Debug
	update_movement_animation()


func _dodge():
	# decrement value to make it dissapear
	dodge_val -= 1
	if dodge_val == 0:
		can_dodge = false
		dodge_update.emit()
	# wait for the dodge_timer to run out
	await dodge_timer.timeout
	# add back the value to make it reappear
	dodge_val += 1  
	# update again
	dodge_update.emit()
	can_dodge = true


		

	
	
