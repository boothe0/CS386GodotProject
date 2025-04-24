extends Node
# signal to consumable and round end scripts
signal consumable_1
signal consumable_2
signal consumable_3
signal round_end
signal player_variables_updated
signal wall_potion_used

signal buy_item_pressed(
	item_name: String, price: int, shop_spot: int, consumable: bool
)

signal remote_shop_item(shop_spot: int)
