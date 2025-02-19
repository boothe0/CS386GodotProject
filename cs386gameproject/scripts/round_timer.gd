extends Label
@onready var timer = $"../../RoundTimer"
var round_over = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var time = int(timer.get_time_left())
	self.set_text(str(time))
	
	if time == 0 and round_over == false:
		round_over = true
		Emitter.emit_signal("round_end")
	
