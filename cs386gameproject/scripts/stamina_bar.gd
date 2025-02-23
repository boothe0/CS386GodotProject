extends ProgressBar

@onready var player = $"../../Player"
@onready var regen_timer = $RegenTimer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	max_value = player.stamina
	value = max_value
	
	player.stamina_update.connect(update)
	player.dodge_used.connect(dodge_used)
	regen_timer.timeout.connect(regen_stamina)
	regen_timer.start()
	
func dodge_used():
	player.stamina -= player.dodge_cost
	update()  
	
func regen_stamina():
	if player.stamina < player.MAX_STAMINA:
		player.stamina += 1
	update()

func update():
	self.value = player.stamina
