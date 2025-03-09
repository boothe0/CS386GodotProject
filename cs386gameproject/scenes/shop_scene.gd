extends Node2D
@onready var coins_to_buy: Label = $Player/coins_to_buy


func _ready() -> void:
	Emitter.buy_item_pressed.connect(_on_buy_item_pressed)
	update_label()

func update_label():
	coins_to_buy.text = "Total Coins: " + str(PlayerVariables.coins)	
func _on_buy_item_pressed(item_name: String, price: int, shop_spot: int, consumable: bool):
	update_label()
