extends Area2D

# projectile variables
const SPEED = 500
var direction = Vector2.ZERO
var damage = 1

func _ready() -> void:
	if not is_connected("body_entered", Callable(self, "_on_body_entered")):
		connect("body_entered", Callable(self, "_on_body_entered"))

	await get_tree().create_timer(3.0).timeout
	queue_free()

	
func _process(delta: float) -> void:
	position += direction * SPEED * delta
	
func set_direction(target_pos, origin_pos):
	# choose current direction
	direction = (target_pos - origin_pos).normalized()
	rotation = direction.angle()
	
func _on_body_entered(body: Node2D) -> void:
	print("Projectile hit: ", body.name, " | Groups: ", body.get_groups(), " | Type: ", body.get_class()) # debugging

	# detect if enemy is hit
	if body.is_in_group("enemies"):
		print("Enemy hit! Applying damage.") # debugging
		body.take_damage(damage)
		queue_free()

	# detect if world boundary is hit
	if body.is_in_group("boundary"):
		queue_free()
