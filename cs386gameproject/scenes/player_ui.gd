extends CanvasLayer

@onready var interactable = get_node("res://scenes/interactables/interactable.tscn")
# array of items to search
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
# array to return the script and the texture from display
var scripts_and_texture = []
var texture
var script_object
var consumable_base = preload("res://scenes/consumables/consumable_base_template.tscn")
var consumable_1 = preload("res://scripts/consumable_1.gd")
var round = PlayerVariables.rounds
@onready var control: Control = $Ability1/Control
func _ready() -> void:
	Emitter.buy_item_pressed.connect(_on_buy_item_pressed)
	Emitter.consumable_1.connect(decrement_num_consumables)
	update_label()
	if round >= 1:
		refresh_ui()
func decrement_num_consumables(num_consumabless):
	PlayerVariables.number_consumables_left -= 1

func update_label():
	total_coins.text = "Total Coins: " + str(PlayerVariables.coins)
func _on_buy_item_pressed(item_name: String, price: int, shop_spot: int, consumable: bool):
	PlayerVariables.number_consumables_left += 1
	buy_ui_consumables()
	update_label()

# searches for the display the player interacted with
func search_display_texture_signal():
	for item in display_items:
		if item and item.in_range:
			var texture = item.texture
			var shop_script_node = item.get_node("TableCollision/Control/ShopItem")
			var script = shop_script_node.item_script
			return [texture, script]

# removes repetative code and attaches texture and script to consumable
func itermediate_loading(b):
		var texture_rect = b.get_node("TextureRect")
		scripts_and_texture = search_display_texture_signal()
		texture = scripts_and_texture[0]
		script_object = scripts_and_texture[1]
		b.position = PlayerVariables.consumable_1_pos
		PlayerVariables.consumables[0]["position"] = b.position
		PlayerVariables.consumables[0]["script"] = script_object
		PlayerVariables.consumables[0]["texture"] = texture
		texture_rect.texture = load(PlayerVariables.consumables[0]["texture"])

# call in the shop scene
func buy_ui_consumables():
	var b = consumable_base.instantiate()
	b.set_script(consumable_1)
	b.size = PlayerVariables.consumable_size
	b.scale.x = PlayerVariables.consumable_scale_x
	b.scale.y = PlayerVariables.consumable_scale_y
	if PlayerVariables.number_consumables == 0:
		itermediate_loading(b)
		b.get_child(0).text = "Z"
		control.add_child(b)

	elif PlayerVariables.number_consumables == 1:
		itermediate_loading(b)
		b.get_child(0).text = "X"
		control.add_child(b)
	else:
		itermediate_loading(b)
		b.get_child(0).text = "C"
		control.add_child(b)

# supposed to check the position and assign appropriate label on reload
func check_position_reload(b, reload_number):
	if reload_number == 0:
		return "Z"
	elif reload_number == 1:
		return "X"
	else:
		return "C"
# reloads the ui
func refresh_ui():
	var items_to_reload_left = PlayerVariables.number_consumables
	for item in PlayerVariables.consumables: 
		if "position" in item and "texture" in item:
			var b = consumable_base.instantiate()
			var label = check_position_reload(b, items_to_reload_left)
			b.get_child(0).text = label
			items_to_reload_left -= 1   
			b.size = PlayerVariables.consumable_size
			b.scale.x = PlayerVariables.consumable_scale_x
			b.scale.y = PlayerVariables.consumable_scale_y
			b.position = item["position"]
			var texture_rect = b.get_node("TextureRect")
			texture_rect.texture = load(item["texture"])
			control.add_child(b)
			
			
			
