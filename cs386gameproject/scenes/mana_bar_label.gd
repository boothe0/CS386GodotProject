extends ProgressBar

@onready var player = $"../../Player"
@onready var regen_timer = $RegenTimer
@onready var label = $ValueIndicator
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	max_value = player.mana
	value = max_value
	label.text = "%d / %d" % [value, max_value]
	
	player.mana_update.connect(update)
	regen_timer.timeout.connect(regen_mana)
	regen_timer.start()
	
func regen_mana():
	if player.mana < player.MAX_MANA:
		player.mana += 1
		update()

func update():
	self.value = player.mana
	label.text = "%d / %d" % [value, max_value]
