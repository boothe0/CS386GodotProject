extends HBoxContainer


func _ready() -> void:
	# called when the node enters the scene tree for the first time.
	Emitter.connect("consumable_3", use_consumable_3)

func use_consumable_3():
	for child in get_children():
		if child.has_method("use"):
			child.use()
