extends Node2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _ready() -> void:
	InputMap.action_erase_events("attack")
	InputMap.action_erase_events("ranged_attack")
	await get_tree().create_timer(0.5).timeout
	audio_stream_player_2d.play()
	audio_stream_player_2d.finished.connect(_on_audio_finished)

func _on_audio_finished():
	audio_stream_player_2d.play()  # Restart the sound when finished
