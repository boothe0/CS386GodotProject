extends Node2D

# enemy spawn logic
var spawn_interval = 3.0
var rng = RandomNumberGenerator.new()

# world bounds
var left_bound_position: int
var right_bound_position: int
var top_bound_position: int
var bottom_bound_position: int

var Enemy = preload("res://scenes/enemy.tscn")
var RangedEnemy = preload("res://scenes/ranged_enemy.tscn")

@onready var top_bound = $ArenaBoundary/CollisionShape2D
@onready var left_bound = $ArenaBoundary/CollisionShape2D2
@onready var bottom_bound = $ArenaBoundary/CollisionShape2D3
@onready var right_bound = $ArenaBoundary/CollisionShape2D4
@onready var SpawnTimer = $SpawnTimer

func _ready() -> void:
	# get arena bounds
	left_bound_position = left_bound.position.x
	right_bound_position = right_bound.position.x
	top_bound_position = top_bound.position.y
	bottom_bound_position = bottom_bound.position.y

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
		var x_cord = rng.randi_range(left_bound_position, right_bound_position)
		result = Vector2(x_cord, top_bound_position)
	elif side == 1:  # right of screen
		var y_cord = rng.randi_range(top_bound_position, bottom_bound_position)
		result = Vector2(right_bound_position, y_cord)
	elif side == 2:  # bottom of screen
		var x_cord = rng.randi_range(left_bound_position, right_bound_position)
		result = Vector2(x_cord, bottom_bound_position)
	else:  # left of screen
		var y_cord = rng.randi_range(top_bound_position, bottom_bound_position)
		result = Vector2(left_bound_position, y_cord)

	return result

func _on_round_timer_timeout() -> void:
	# send player to shop after end of round
	print("Something") # debugging
	get_tree().change_scene_to_file("res://scenes/shop_scene.tscn")
