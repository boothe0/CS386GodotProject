extends CanvasLayer

@onready var display_1: Area2D = $"../Display1"

@onready var total_coins: Label = $Coins/HBoxContainer/TotalCoins
var number_consumables_left = 0
var consumable_base = preload("res://scenes/consumables/consumable_base_template.tscn")
var consumable_1 = preload("res://scripts/consumable_1.gd")
@onready var control: Control = $Ability1/Control
func _ready() -> void:
	Emitter.buy_item_pressed.connect(_on_buy_item_pressed)
	update_label()
	var temp = PlayerVariables.number_consumables
	while temp > 0:
		print("There are consumables here")
		number_consumables_left += 1
		temp -= 1
		load_ui_consumables()

func update_label():
	total_coins.text = "Total Coins: " + str(PlayerVariables.coins)
func _on_buy_item_pressed(item_name: String, price: int, shop_spot: int, consumable: bool):
	PlayerVariables.number_consumables += 1
	number_consumables_left += 1
	load_ui_consumables()
	update_label()

# load only once
func load_ui_consumables():
	var b = consumable_base.instantiate()
	var texture_rect = b.get_node("TextureRect")
	b.set_script(consumable_1)
	b.size = PlayerVariables.consumable_size
	b.scale.x = PlayerVariables.consumable_scale_x
	b.scale.y = PlayerVariables.consumable_scale_y
	if number_consumables_left == 1:
		b.get_child(0).text = "Z"
		b.position = PlayerVariables.consumable_1_pos
		PlayerVariables.consumables[0]["key"] = "texture"
		PlayerVariables.consumables[0]["texture"] = display_1.texture
		print(PlayerVariables.consumables[0]["texture"])
		texture_rect.texture = load(PlayerVariables.consumables[0]["texture"])
	elif number_consumables_left == 2:
		b.position = PlayerVariables.consumable_2_pos
		b.get_child(0).text = "X"
	else:
		b.position = PlayerVariables.consumable_3_pos
		b.get_child(0).text = "C"
	control.add_child(b)
