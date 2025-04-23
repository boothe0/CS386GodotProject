extends Node2D

# enemy spawn logic
var spawn_interval = 3.0
var rng = RandomNumberGenerator.new()

# world bounds
var left_bound: int
var right_bound: int
var top_bound: int
var bottom_bound: int

var Enemy = preload("res://scenes/enemy.tscn")
var RangedEnemy = preload("res://scenes/ranged_enemy.tscn")

@onready var GroundLayer = $GroundLayer
@onready var SpawnTimer = $SpawnTimer

func _ready() -> void:
	var ground_rect = GroundLayer.get_used_rect()
	var ground_position = ground_rect.position

	# add offset to ensure enemies in bounds
	var in_bounds_offset = GroundLayer.rendering_quadrant_size * 2

	# get arena bounds
	left_bound = ground_position.x + in_bounds_offset
	right_bound = ground_position.x + ground_rect.size.x * GroundLayer.rendering_quadrant_size
	top_bound = ground_position.y + in_bounds_offset
	bottom_bound = ground_position.y + ground_rect.size.y * GroundLayer.rendering_quadrant_size

	# start spawn interval timer
	SpawnTimer.wait_time = spawn_interval
	SpawnTimer.timeout.connect(_on_SpawnTimer_timeout)
	SpawnTimer.start()

func _on_SpawnTimer_timeout():
	# Randomly choose between Enemy and RangedEnemy with 50% probability
	var enemy_scene = Enemy if rng.randi_range(0, 1) == 0 else RangedEnemy
	
	# spawn an enemy at random position
	var e = enemy_scene.instantiate()
	e.position = get_random_position()
	add_child(e)

func get_random_position() -> Vector2:
	# use bounds to spawn enemy on sides of screen
	var result: Vector2
	var side = rng.randi_range(0, 3)
	if side == 0:  # top of screen
		var x_cord = rng.randi_range(left_bound, right_bound)
		result = Vector2(x_cord, top_bound)
	elif side == 1:  # right of screen
		var y_cord = rng.randi_range(top_bound, bottom_bound)
		result = Vector2(right_bound, y_cord)
	elif side == 2:  # bottom of screen
		var x_cord = rng.randi_range(left_bound, right_bound)
		result = Vector2(x_cord, bottom_bound)
	else:  # left of screen
		var y_cord = rng.randi_range(top_bound, bottom_bound)
		result = Vector2(left_bound, y_cord)

	return result

func _on_round_timer_timeout() -> void:
	# send player to shop after end of round
	print("Something") # debugging
	get_tree().change_scene_to_file("res://scenes/shop_scene.tscn")
