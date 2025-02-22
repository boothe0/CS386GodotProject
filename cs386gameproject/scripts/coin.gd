extends Area2D

@onready var player = get_node("/root/MainScene/Player")

const bronze_coin = preload("res://assets/bronze-coin.png")
const silver_coin = preload("res://assets/silver-coin.png")
const gold_coin = preload("res://assets/gold-coin.png")

var textures = [bronze_coin, silver_coin, gold_coin]
var coin_type : int = 0  # The coin type can still affect appearance if desired.

var bronze_amount = 1
var silver_amount = 3
var gold_amount = 5

func _ready() -> void:
	$Sprite2D.texture = textures[coin_type]

func _on_body_entered(body: Node2D) -> void:
	# Instead of doing any conversion, simply add one coin to the total.
	if coin_type == 0:
		player.add_coins(bronze_amount, 0)
		print("Total coins: " + str(player.cumulative_coin_total))
	if coin_type == 1:
		player.add_coins(silver_amount, 1)
		print("Total coins: " + str(player.cumulative_coin_total))
	if coin_type == 2:
		player.add_coins(gold_amount, 2)
		print("Total coins: " + str(player.cumulative_coin_total))
	queue_free()
