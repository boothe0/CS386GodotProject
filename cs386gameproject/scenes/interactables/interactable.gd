extends Area2D

@onready var table_collision: CollisionShape2D = $TableCollision
@onready var shop_item: VBoxContainer = $TableCollision/ShopItem

@export var interact_name: String = ""
@export var is_interactable: bool = true
@export var has_been_interacted: bool = false

# add more consumables to spawn here
const HP_TEXTURE = "res://assets/VariPixels PotionsPack 02112022 Update/hpPotion.png"

var texture
var nameConsumable
var price
var consumable
var description

# Trigger interaction
var interact: Callable = func():
	print("interaction triggered")
	has_been_interacted = true
	print(has_been_interacted)

		
func _ready() -> void:
	if Input.is_action_just_pressed("interact"):
		toggle_buy()

# Function to update the item when interacted with
func update_item(texture: String, name: String, price: int, consumable: bool, description: String) -> void:
	interact_name = name  # Optionally set the name to display on interaction
	is_interactable = true  # Enable interaction or set any other flags you need
	print("Item Interacted: ", name)  # Optional for debugging

func toggle_buy() -> void:
	shop_item.visible = not shop_item.visible
