extends Area2D
@onready var item := $TableCollision/Control/ShopItem
var in_range = false
@onready var label: Label = $CollisionShape2D/Label
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _process(delta):
	if Input.is_action_just_pressed("interact") and in_range:
		if item.buy_item_pressed(): # successfully bought item
			audio_stream_player_2d.play()
			self.set_script(null) # detach script from node

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		in_range = true
		item.display_in_range()

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		in_range = false
		item.display_out_of_range()
		
	
