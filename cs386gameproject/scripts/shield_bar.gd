extends ProgressBar

@onready var player = $"../../Player"
@onready var regen_timer = $RegenTimer

const REGEN_DELAY = 3.0  # seconds to wait after damage before regen starts
const REGEN_AMOUNT = 1   # how much shield to regen per tick

var time_since_damage = 0.0
var is_taking_damage = false


func _ready() -> void:
	max_value = player.shield
	value = max_value
	
	player.shield_update.connect(update)
	player.shield_update.connect(reset_regen_timer)
	regen_timer.timeout.connect(regen_shield)
	
	regen_timer.start()


func update():
	# update shield value on the bar
	self.value = player.shield


func reset_regen_timer():
	# called when shield is updated (likely due to damage)
	time_since_damage = 0.0
	is_taking_damage = true
	regen_timer.stop()
	regen_timer.start(REGEN_DELAY)


func regen_shield():
	# regen shield only if not taking damage recently
	if player.shield < player.MAX_SHIELD:
		player.shield += REGEN_AMOUNT
		player.shield_update.emit()  # trigger shield bar update
	is_taking_damage = false  # now able to regen again
	regen_timer.start()  # keep looping
