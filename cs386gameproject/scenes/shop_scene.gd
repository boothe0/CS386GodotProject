extends Node2D
@onready var coins_to_buy: Label = $Player/coins_to_buy


func _ready() -> void:
	coins_to_buy.text = "Total Coins: " + str(PlayerVariables.coins)
