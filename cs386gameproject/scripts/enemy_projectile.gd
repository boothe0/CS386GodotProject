extends Area2D

@export var speed: float = 300  # Projectile movement speed
@export var lifetime: float = 3.0  # Max time before disappearing

var velocity: Vector2 = Vector2.ZERO

func _ready():
	set_process(true)
	z_index = 10  # Bring projectile to the front
	print("Projectile _ready: processing enabled, lifetime timer started")
	await get_tree().create_timer(lifetime).timeout
	queue_free()

func _process(delta):
	if velocity == Vector2.ZERO:
		print("Projectile has no velocity")
	else:
		print("Projectile moving with velocity: ", velocity)
	position += velocity * delta
	print("Projectile position: ", position)

func fire(target_position: Vector2):
	print("Projectile fired towards: ", target_position)
	var direction = (target_position - global_position)
	if direction.length() == 0:
		print("Warning: Zero direction vector in fire()")
		velocity = Vector2.ZERO
	else:
		velocity = direction.normalized() * speed

func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.take_damage()  
	queue_free()  # Destroy projectile upon impact
