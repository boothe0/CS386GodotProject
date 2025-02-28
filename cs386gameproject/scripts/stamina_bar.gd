extends ProgressBar

@onready var player = $"../../Player"
@onready var regen_timer = $RegenTimer


func _ready() -> void:
	max_value = player.stamina
	value = max_value
	
	player.stamina_update.connect(update)
	player.dodge_used.connect(dodge_used)
	regen_timer.timeout.connect(regen_stamina)
	regen_timer.start()
	
func dodge_used():
	# use stamina if dodge
	player.stamina -= player.dodge_cost
	update()  

func regen_stamina():
	# regen stamina over time
	if player.stamina < player.MAX_STAMINA:
		player.stamina += 1
	update()

func update():
	# update stamina value
	self.value = player.stamina
