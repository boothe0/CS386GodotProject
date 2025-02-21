extends VBoxContainer
@onready var texture_rect = $TextureRect
@onready var item_name_box = $HBoxContainer2/ItemName
@onready var price_box = $HBoxContainer2/Price
@onready var buy_button = $HBoxContainer/Button
@onready var item_type_box = $VBoxContainer/Type
@onready var description_box = $VBoxContainer/Description

# TODO: generate random item ID to get random item data JSON

# TODO: store item data as JSON
#		parse JSON data into these fields
const TEXTURE = "res://assets/VariPixels PotionsPack 02112022 Update/hpPotion.png"
const NAME = "Health Potion"
const PRICE = 25
const SHOP_SPOT = 0
const CONSUMABLE = true
const DESCRIPTION = "Heals 2HP"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture_rect.texture = load(TEXTURE)
	item_name_box.text = NAME
	price_box.text = "%d G" % PRICE
	item_type_box.text = "Consumable" if CONSUMABLE else "Upgrade"
	description_box.text = DESCRIPTION
	
	buy_button.pressed.connect(buy_item_pressed)


func buy_item_pressed():
	Emitter.buy_item_pressed.emit(NAME, PRICE, SHOP_SPOT, CONSUMABLE)
