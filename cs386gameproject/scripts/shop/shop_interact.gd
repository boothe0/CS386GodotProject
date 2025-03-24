extends Area2D
@onready var item := $TableCollision/Control/ShopItem
@export var texture = ""
var in_range = false

func _process(delta):
	if Input.is_action_just_pressed("interact") and in_range:
		if item.buy_item_pressed(): # successfully bought item
			self.set_script(null) # detach script from node

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		in_range = true
		texture = item.display_in_range()
		print(texture)
func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		in_range = false
		item.display_out_of_range()
