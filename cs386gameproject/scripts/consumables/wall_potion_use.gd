extends TextureRect


func use():
	Emitter.emit_signal("wall_potion_used")
	queue_free()
	
