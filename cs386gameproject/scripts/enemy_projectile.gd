extends Area2D

@export var speed: float = 300  # Projectile movement speed
@export var lifetime: float = 3.0  # Max time before disappearing

var velocity: Vector2
var target: Node2D  # The target (player) the projectile should move toward

func _ready():
	# Start a timer to remove the projectile after 'lifetime' seconds
	await get_tree().create_timer(lifetime).timeout
	queue_free()

func _process(delta):
	if velocity == Vector2.ZERO:
		print("Projectile has no velocity") # debugging
	# Move the projectile forward
	position += velocity * delta

func fire(target_position: Vector2):
	print("Projectile fired towards: ", target_position) # debugging
	# Calculate direction toward the target
	var direction = (target_position - global_position).normalized()
	velocity = direction * speed

func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.take_damage()  
	queue_free()  # Destroy projectile upon impact
