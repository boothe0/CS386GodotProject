extends Node2D

var health: int

@export var max_health := 10
@onready var sprite := $Sprite2D

func _ready():
	health = max_health

func take_damage(amount: int):
	# destroys objective is health runs out
	health -= amount
	if health <= 0:
		queue_free()
		print("Objective destroyed!")
