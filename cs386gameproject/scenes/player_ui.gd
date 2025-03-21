extends CanvasLayer

@onready var total_coins: Label = $Coins/HBoxContainer/TotalCoins


func _ready() -> void:
	Emitter.buy_item_pressed.connect(_on_buy_item_pressed)
	update_label()

func update_label():
	total_coins.text = "Total Coins: " + str(PlayerVariables.coins)	
func _on_buy_item_pressed(item_name: String, price: int, shop_spot: int, consumable: bool):
	update_label()
