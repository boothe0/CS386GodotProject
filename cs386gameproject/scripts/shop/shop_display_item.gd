extends VBoxContainer

signal item_interacted(texture, name, price, consumable, description)

const RARITY_ODDS = {
	0.55: "common",
	0.3: "uncommon",
	0.1: "rare",
	0.05: "legendary",
}  # THIS MUST ALWAYS ADD TO 1!

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
var item_script
const SHOP_SPOT = 0

var rand := RandomNumberGenerator.new()

var item_path = "res://scenes/shop_items/"

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
	item_path += _select_item_type() + "/"
	item_path += _select_rarity() + "/"
	var dir = DirAccess.open(item_path)

	if dir:
		var file_names = dir.get_files()
		if file_names.is_empty():
			print("No files found in directory!")
		else:
			var random_file = file_names[randi_range(0, file_names.size() - 1)]
			var full_file_path = item_path + random_file
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
						item_script = json_as_dict.get("script", item_script)
						item_script = load(item_script)
					else:
						print("Error parsing JSON")
			else:
				print("File does not exist: ", full_file_path)
	else:
		print("Failed to open directory: ", item_path)

func display_in_range():
		vbox.visible = true
		hbox.visible = true
		buy_hint.visible = true
	
func display_out_of_range():
	vbox.visible = false
	hbox.visible = false
	buy_hint.visible = false

func buy_item_pressed():
	if PlayerVariables.coins - price < 0:	
		print("cannot buy")
		return false
		
	if not consumable:  # upgrade
		item_script = item_script.new()  # instantiate the script
		item_script.apply()
		
	PlayerVariables.coins -= price
	print(PlayerVariables.coins)  # Print the updated coins
	# Now emit the signal after updating coins
	Emitter.buy_item_pressed.emit(nameConsumable, price, SHOP_SPOT, consumable)
	self.queue_free()
	return true

func _select_item_type():
	var choices = {
		0: "consumables",
		1: "upgrades",
	}
	return choices[rand.randi_range(0, 1)]

func _select_rarity():
	var choice = randf()
	var total_weight = 0.0
	for key in RARITY_ODDS:
		total_weight += key
		if choice <= total_weight:
			return RARITY_ODDS[key]
	return "legendary" 
