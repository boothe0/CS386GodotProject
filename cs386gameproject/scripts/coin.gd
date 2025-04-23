extends Area2D

const bronze_coin = preload("res://assets/bronze-coin.png")
const silver_coin = preload("res://assets/silver-coin.png")
const gold_coin = preload("res://assets/gold-coin.png")

# coin type containers
var textures = [bronze_coin, silver_coin, gold_coin]
var coin_type : int = 0

# coin amounts
var bronze_amount = 1
var silver_amount = 3
var gold_amount = 5

@onready var player = get_node("/root/MainScene/Player")


func _ready() -> void:
	$Sprite2D.texture = textures[coin_type]

func _on_body_entered(body: Node2D) -> void:
	# Adding coins to the total in player script
	if coin_type == 0:
		player.add_coins(bronze_amount, 0)
		print("Total coins: " + str(player.cumulative_coin_total)) # debugging
	if coin_type == 1:
		player.add_coins(silver_amount, 1)
		print("Total coins: " + str(player.cumulative_coin_total)) # debugging
	if coin_type == 2:
		player.add_coins(gold_amount, 2)
		print("Total coins: " + str(player.cumulative_coin_total)) # debugging
	queue_free()
