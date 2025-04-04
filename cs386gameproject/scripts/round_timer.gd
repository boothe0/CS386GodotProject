extends Label

var round_over = false
@onready var timer = $"../../RoundTimer"


func _process(delta: float) -> void:
	# called every frame. 'delta' is the elapsed time since the previous frame.
	if timer:
		var time = int(timer.get_time_left())
		self.set_text(str(time))
		
		# end round when time is up
		if time == 0 and round_over == false:
			round_over = true
			PlayerVariables.rounds += 1
			Emitter.emit_signal("round_end")
