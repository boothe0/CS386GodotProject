extends Node2D

var health: int

@export var max_health := 10
@onready var sprite := $Sprite2D
@onready var area_detection = $Area2D
@onready var damage_timer = $DamageTimer

var enemies: int

func _ready():
	health = max_health
	connect("body_entered", _on_area_2d_body_entered)
	connect("body_exited", _on_area_2d_body_exited)
	damage_timer.timeout.connect(_on_SpawnTimer_timeout)
	damage_timer.start()
	
func take_damage(amount: int):
	health -= amount
	print("objective Health: %d" % health)
	if health <= 0:
		queue_free()
		print("Objective destroyed!")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name != "Player":
		enemies += 1

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name != "Player":
		enemies -= 1

# this is a terrible hack, but its better than more global signals!
func _on_SpawnTimer_timeout():
	if enemies > 0:
		print("enemies in zone %d" % enemies)
		take_damage(enemies)
