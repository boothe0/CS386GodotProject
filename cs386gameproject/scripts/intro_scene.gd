extends CanvasLayer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer/ContinueButton.grab_focus()
	audio_stream_player_2d.stream = preload("res://assets/sound-effects/wife_singing.wav")
	audio_stream_player_2d.play()
	audio_stream_player_2d.finished.connect(_on_audio_finished)

func _on_continue_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_scene.tscn")
func _on_audio_finished():
	audio_stream_player_2d.play()  # Restart the sound when finished
