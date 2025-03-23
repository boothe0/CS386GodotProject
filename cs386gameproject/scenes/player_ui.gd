extends CanvasLayer

@onready var total_coins: Label = $Coins/HBoxContainer/TotalCoins
@onready var consumable_set = PlayerVariables.consumable_set
var consumable_base = preload("res://scenes/consumables/consumable_base_template.tscn")
var consumable_1 = preload("res://scripts/consumable_1.gd")
@onready var control: Control = $Ability1/Control

func _ready() -> void:
	Emitter.buy_item_pressed.connect(_on_buy_item_pressed)
	update_label()

func update_label():
	total_coins.text = "Total Coins: " + str(PlayerVariables.coins)    

func _on_buy_item_pressed(item_name: String, price: int, shop_spot: int, consumable: bool):
	update_label()
	
	# Ensure consumable_base is a valid PackedScene
	if consumable_base:
		var b = consumable_base.instantiate()
		var texture_rect = b.get_node("TextureRect")

		b.set_script(consumable_1)
		texture_rect.texture = load("res://assets/VariPixels PotionsPack 02112022 Update/hpPotion.png")
		b.size = Vector2(50, 40)
		b.position = Vector2(1000, 0)
		b.scale.x = 3
		b.scale.y = 3.4
		consumable_set.append(b)
		control.add_child(b)
	else:
		print("Error: consumable_base scene failed to load!")
