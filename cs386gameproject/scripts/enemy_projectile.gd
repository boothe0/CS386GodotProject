extends Area2D

const DAMAGE = 1
@export var speed: float = 300  # Projectile movement speed
@export var lifetime: float = 3.0  # Max time before disappearing

var velocity: Vector2 = Vector2.ZERO

func _ready():
	set_process(true)
	z_index = 10  # Bring projectile to the front
	await get_tree().create_timer(lifetime).timeout
	queue_free()

func _process(delta):
	position += velocity * delta

func fire(target_position: Vector2):
	var direction = (target_position - global_position)
	if direction.length() == 0:
		print("Warning: Zero direction vector in fire()")
		velocity = Vector2.ZERO
	else:
		velocity = direction.normalized() * speed

func _on_body_entered(body):
	if body.name == "Player":
		print("inside player")
		body.take_damage(DAMAGE)  
	queue_free()  # Destroy projectile upon impact
