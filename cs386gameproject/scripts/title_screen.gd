extends CanvasLayer

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _ready() -> void:
	# called when the node enters the scene tree for the first time.
	$CanvasLayer/VBoxContainer/StartButton.grab_focus()
	audio_stream_player_2d.stream = preload("res://assets/sound-effects/main_theme.wav")
	audio_stream_player_2d.play()

	audio_stream_player_2d.finished.connect(_on_audio_finished)
func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/intro_scene.tscn")
	audio_stream_player_2d.stop()
func _on_tutorial_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/tutorial.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()
func _on_audio_finished():
	audio_stream_player_2d.play()  # Restart the sound when finished
