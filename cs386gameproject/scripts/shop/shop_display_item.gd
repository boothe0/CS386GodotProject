extends VBoxContainer

# TODO: generate random item ID to get random item data JSON


# TODO: store item data as JSON
#		parse JSON data into these fields
const TEXTURE = "res://assets/VariPixels PotionsPack 02112022 Update/hpPotion.png"
const NAME = "Health Potion"
const PRICE = 25
const SHOP_SPOT = 0
const CONSUMABLE = true
const DESCRIPTION = "Heals 2HP"

@onready var texture_rect = $TextureRect
@onready var item_name_box = $HBoxContainer2/ItemName
@onready var price_box = $HBoxContainer2/Price
@onready var buy_button = $HBoxContainer/Button
@onready var item_type_box = $VBoxContainer/Type
@onready var description_box = $VBoxContainer/Description

var pathDictionaries = {
	"Common Items" : "res://scenes/shop_items/consumables/common/",
	"Legendary Items" : "res://scenes/shop_items/consumables/legendary/"
}
var paths = pathDictionaries.values()

func _ready() -> void:
	
	var random_index = randi_range(0, pathDictionaries.size() - 1)
	var dir_name = paths[random_index]
	var dir = DirAccess.open(dir_name)
	# Defensive programming, not even once
	if dir:
		var file_names = dir.get_files()
		
		if file_names.is_empty():
			print("No files found in directory!")
		else:
			var random_file = file_names[randi_range(0, file_names.size() - 1)]
			var full_file_path = dir_name + random_file
			
			if FileAccess.file_exists(full_file_path):
				var json_as_text = FileAccess.get_file_as_string(full_file_path)
				
				if json_as_text.is_empty():
					print("Error: JSON file is empty")
				else:
					var json_as_dict = JSON.parse_string(json_as_text)
					if json_as_dict:
						print(json_as_dict)
					else:
						print("Error parsing JSON")
			else:
				print("File does not exist: ", full_file_path)
	else:
		print("Failed to open directory: ", dir_name)

	texture_rect.texture = load(TEXTURE)
	item_name_box.text = NAME
	price_box.text = "%d G" % PRICE
	item_type_box.text = "Consumable" if CONSUMABLE else "Upgrade"
	description_box.text = DESCRIPTION
	
	buy_button.pressed.connect(buy_item_pressed)

func buy_item_pressed():
	# buy the item that was selected
	Emitter.buy_item_pressed.emit(NAME, PRICE, SHOP_SPOT, CONSUMABLE)
