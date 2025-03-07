extends Area2D

@onready var table_collision: CollisionShape2D = $TableCollision
@onready var texture_rect: TextureRect = $TableCollision/TextureRect

@export var interact_name: String = ""
@export var is_interactable: bool = true
@export var has_been_interacted: bool = false
# add more consumables to spawn here
const HP_TEXTURE = "res://assets/VariPixels PotionsPack 02112022 Update/hpPotion.png"

# triggering this from the interaction component
var interact: Callable = func():
	print("interaction triggered")
	
	has_been_interacted = true
	print(has_been_interacted)
		
func _ready() -> void:
	# loading texture
	texture_rect.texture = load(HP_TEXTURE)
