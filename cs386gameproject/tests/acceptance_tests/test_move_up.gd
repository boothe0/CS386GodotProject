extends GutTest

const MAIN_SCENE := "res://scenes/main_scene.tscn"
const PLAYER_PATH := "Player"

var main_root: Node
var player: CharacterBody2D

func before_each() -> void:
	main_root = preload(MAIN_SCENE).instantiate()
	get_tree().root.add_child(main_root)

	player = main_root.get_node(PLAYER_PATH) as CharacterBody2D
	assert_not_null(player, "Couldn't find player at %s inside Main.tscn" % PLAYER_PATH)

	await get_tree().process_frame

func after_each() -> void:
	if is_instance_valid(main_root):
		main_root.queue_free()
	Input.action_release("ui_up")

func test_press_w_moves_player_up_in_main_scene() -> void:
	var start_y = player.global_position.y

	Input.action_press("ui_up", 1.0)
	await get_tree().physics_frame
	Input.action_release("ui_up")

	assert_true(
		player.global_position.y < start_y,
		"In Main.tscn, pressing W should move the player up (y ↓). " +
		"Started at %f, ended at %f"
		% [start_y, player.global_position.y]
	)
