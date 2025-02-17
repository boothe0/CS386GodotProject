extends Area2D

@onready var main = get_node("/root/MainScene")
@onready var player = get_node("/root/MainScene/Player")
@onready var bronze_label = get_node("/root/MainScene/PlayerUI/Coins/bronze_coin")
@onready var silver_label = get_node("/root/MainScene/PlayerUI/Coins/silver_coin")
@onready var gold_label = get_node("/root/MainScene/PlayerUI/Coins/gold_coin")

var coin_type : int # 0: bronze, 1: silver, 2: gold

const bronze_coin = preload("res://assets/bronze-coin.png")
const silver_coin = preload("res://assets/silver-coin.png")
const gold_coin = preload("res://assets/gold-coin.png")

var textures = [bronze_coin, silver_coin, gold_coin]

func _ready() -> void:
	$Sprite2D.texture = textures[coin_type]

func _on_body_entered(body: Node2D) -> void:
	#bronze
	if coin_type == 0:
		print("bronze coin")
		player.bronze_coins += 1
		bronze_label.text = "Bronze Coins: " + str(player.bronze_coins)
	elif coin_type == 1:
		print("silver coin")
		player.silver_coins += 1
		silver_label.text = "Silver Coins: " + str(player.silver_coins)
	elif coin_type == 2:
		print("gold coin")
		player.gold_coins += 1
		gold_label.text = "Gold Coins: " + str(player.gold_coins)

	queue_free()
