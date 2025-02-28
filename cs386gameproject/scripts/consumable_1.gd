extends HBoxContainer


func _ready() -> void:
	# called when the node enters the scene tree for the first time.
	Emitter.connect("consumable_1", use_consumable_1)

func use_consumable_1():
	for child in get_children():
		if child.has_method("use"):
			child.use()
