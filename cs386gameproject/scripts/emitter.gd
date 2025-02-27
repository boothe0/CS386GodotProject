extends Node
# signal to consumable and round end scripts
signal consumable_1
signal consumable_2
signal consumable_3
signal round_end

signal buy_item_pressed(
	item_name: String, price: int, shop_spot: int, consumable: bool
)

signal remote_shop_item(shop_spot: int)

func debug():
	print("debug pressed")
	update_sword_scale(2.0)
	
func update_sword_scale(modifier: float):
	var player = $"../Player"
	var sword = player.get_node("Sword")
	sword.scale = Vector2(sword.scale.x * modifier, sword.scale.y * modifier)
