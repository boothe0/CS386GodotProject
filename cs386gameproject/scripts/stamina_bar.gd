extends ProgressBar
@onready var player = $Player
@onready var regen_timer = $RegenTimer

var stamina = PlayerVariables.stamina

func _ready() -> void:
	await get_tree().process_frame
	player = $"../../Player"
	if player:
		max_value = stamina
		value = max_value
		player.stamina_update.connect(update)
		player.dodge_used.connect(dodge_used)
		regen_timer.timeout.connect(regen_stamina)
		regen_timer.start()


func dodge_used(stamina):
	update(stamina)
func regen_stamina():
	# regen stamina over time
	if stamina < PlayerVariables.MAX_STAMINA:
		stamina += 1
	
func update(stamina):
	# update stamina value
	self.value = stamina
	print(self.value)
