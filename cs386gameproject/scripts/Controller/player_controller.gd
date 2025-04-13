extends Node

const BASE_SPEED = 150

@onready var player = get_parent()
@onready var animated_sprite = player.animated_sprite

# movement, dash and dodge
var last_direction = Vector2.DOWN 
var last_movement_direction = Vector2.DOWN
var dash_direction = Vector2()

func _physics_process(_delta):
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
		player.velocity = direction.normalized() * BASE_SPEED
		player.move_and_slide()

	update_movement_animation()

	# handle potion use
	if Input.is_action_just_pressed("use_potion"):
		player.use_heal_potion()

	if Input.is_action_just_pressed("use_potion_1"):
		Emitter.emit_signal("consumable_1")

	if Input.is_action_just_pressed("use_potion_2"):
		Emitter.emit_signal("consumable_2")

	if Input.is_action_just_pressed("use_potion_3"):
		Emitter.emit_signal("consumable_3")

	# handle attacking
	if Input.is_action_just_pressed("attack"):
		player.swing_sword()
		player.weapon_animation_done = true

	if Input.is_action_just_pressed("ranged_attack") and player.weapon_animation_done != false:
		player.shoot()

	# handle dodging
	if Input.is_action_just_pressed("dodge"):
		if player.stamina_bar == null:
			print("cannot dash here") # debugging
			return  
		elif player.stamina_bar.value < player.dodge_cost:
			return

		player.emit_used_dodge_signal()

		dash_direction = direction.normalized()
		player.velocity = player.dash_direction * player.dash_speed
		player.velocity += Vector2(1.0 - (player.friction * _delta), 1.0 - (player.friction * _delta))
		player.move_and_collide(player.velocity)
		
func update_movement_animation():
	# interrupt movement animation if attacking with sword
	if player.sword.attacking:
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
