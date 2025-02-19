extends Label
@onready var timer = $"../../RoundTimer"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var time = int(timer.get_time_left())
	self.set_text(str(time))
	Emitter.emit_signal("round_end")
