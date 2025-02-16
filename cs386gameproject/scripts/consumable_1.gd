extends HBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Emitter.connect("consumable_1", use_consumable_1)

func use_consumable_1():
	print("calling use_consumable_1") # debug
	for child in get_children():
		if child.has_method("use"):
			print("using consumable 1") # debug
			child.use()
