extends VBoxContainer

signal item_interacted(texture, name, price, consumable, description)

@onready var texture_rect = $TextureRect
@onready var hbox = $HBoxContainer2
@onready var vbox = $VBoxContainer
@onready var item_name_box = $HBoxContainer2/ItemName
@onready var price_box = $HBoxContainer2/Price
@onready var buy_hint = $BuyHint
@onready var item_type_box = $VBoxContainer/Type
@onready var description_box = $VBoxContainer/Description
var texture
var nameConsumable
var price
var consumable
var description
const SHOP_SPOT = 0

var pathDictionaries = {
	"Common Items" : "res://scenes/shop_items/consumables/common/",
	"Legendary Items" : "res://scenes/shop_items/consumables/legendary/"
}
var paths = pathDictionaries.values()

func _ready() -> void:
	# Load items only once at the start
	load_random_item()
	display_out_of_range()
	# Set initial UI values from loaded item
	texture_rect.texture = load(texture)
	item_name_box.text = nameConsumable
	price_box.text = "%d G" % price
	item_type_box.text = "Consumable" if consumable else "Upgrade"
	description_box.text = description

func load_random_item() -> void:
	var random_index = randi_range(0, pathDictionaries.size() - 1)
	var dir_name = paths[random_index]
	var dir = DirAccess.open(dir_name)

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
						texture = json_as_dict.get("texture", texture)  # Fallback to default texture

						nameConsumable = json_as_dict.get("name", nameConsumable)
						price = json_as_dict.get("price", price)
						consumable = json_as_dict.get("consumable", consumable)
						description = json_as_dict.get("description", description)
					else:
						print("Error parsing JSON")
			else:
				print("File does not exist: ", full_file_path)
	else:
		print("Failed to open directory: ", dir_name)

func display_in_range():
	vbox.visible = true
	hbox.visible = true
	buy_hint.visible = true
	
func display_out_of_range():
	vbox.visible = false
	hbox.visible = false
	buy_hint.visible = false

func buy_item_pressed():
	if PlayerVariables.coins - price >= 0:
		PlayerVariables.coins -= price
		print(PlayerVariables.coins)  # Print the updated coinsa
	# Now emit the signal after updating coins
		Emitter.buy_item_pressed.emit(nameConsumable, price, SHOP_SPOT, consumable)
		self.queue_free()
		return true
	else:
		print("cannot buy")
