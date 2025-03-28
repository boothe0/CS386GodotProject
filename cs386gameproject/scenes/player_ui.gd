extends CanvasLayer

@onready var interactable = get_node("res://scenes/interactables/interactable.tscn")

@onready var display_items = [
	$"../Display1",
	$"../Display2",
	$"../Display3",
	$"../Display4",
	$"../Display5",
	$"../Display6",
	$"../Display7",
	$"../Display8",
	$"../Display9",
	$"../Display10"
];

@onready var total_coins: Label = $Coins/HBoxContainer/TotalCoins
@onready var number_consumables_left = 0
var scripts_and_texture = []
var texture
var script_object
var consumable_base = preload("res://scenes/consumables/consumable_base_template.tscn")
var consumable_1 = preload("res://scripts/consumable_1.gd")
var round = PlayerVariables.rounds
@onready var control: Control = $Ability1/Control
func _ready() -> void:
	Emitter.buy_item_pressed.connect(_on_buy_item_pressed)
	update_label()
	if round >= 1:
		refresh_ui()

func update_label():
	total_coins.text = "Total Coins: " + str(PlayerVariables.coins)
func _on_buy_item_pressed(item_name: String, price: int, shop_spot: int, consumable: bool):
	PlayerVariables.number_consumables += 1
	PlayerVariables.number_consumables_left += 1
	buy_ui_consumables()
	update_label()
	print(PlayerVariables.number_consumables_left)

func search_display_signal():
	for item in display_items:
		if item and item.in_range:
			var texture = item.texture
			var shop_script_node = item.get_node("TableCollision/Control/ShopItem")
			var script = shop_script_node.item_script
			return texture


# load only once
func buy_ui_consumables():
	var b = consumable_base.instantiate()
	var texture_rect = b.get_node("TextureRect")
	b.set_script(consumable_1)
	b.size = PlayerVariables.consumable_size
	b.scale.x = PlayerVariables.consumable_scale_x
	b.scale.y = PlayerVariables.consumable_scale_y
	if PlayerVariables.number_consumables_left == 1:
		texture = search_display_signal()
		b.get_child(0).text = "Z"
		b.position = PlayerVariables.consumable_1_pos
		PlayerVariables.consumables[0]["position"] = b.position
		PlayerVariables.consumables[0]["script"] = script_object
		PlayerVariables.consumables[0]["texture"] = texture
		texture_rect.texture = load(PlayerVariables.consumables[0]["texture"])
		print(PlayerVariables.consumables[0]["position"])
	elif PlayerVariables.number_consumables_left == 2:
		texture = search_display_signal()
		b.get_child(0).text = "X"
		b.position = PlayerVariables.consumable_2_pos
		PlayerVariables.consumables[1]["position"] = b.position
		PlayerVariables.consumables[1]["script"] = script_object
		PlayerVariables.consumables[1]["texture"] = texture
		texture_rect.texture = load(PlayerVariables.consumables[1]["texture"])
	else:
		texture = search_display_signal()
		b.get_child(0).text = "C"
		b.position = PlayerVariables.consumable_3_pos
		PlayerVariables.consumables[2]["position"] = b.position
		PlayerVariables.consumables[2]["script"] = script_object
		PlayerVariables.consumables[2]["texture"] = texture
		texture_rect.texture = load(PlayerVariables.consumables[2]["texture"])
	control.add_child(b)

func refresh_ui():
	for item in PlayerVariables.consumables: 
		if "position" in item and "texture" in item:
			var b = consumable_base.instantiate()
			b.size = PlayerVariables.consumable_size
			b.scale.x = PlayerVariables.consumable_scale_x
			b.scale.y = PlayerVariables.consumable_scale_y
			b.position = item["position"]
			var texture_rect = b.get_node("TextureRect")
			texture_rect.texture = load(item["texture"])
			control.add_child(b)
			
