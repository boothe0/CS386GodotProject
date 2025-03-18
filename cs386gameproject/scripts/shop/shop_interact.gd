extends Area2D
@onready var item := $TableCollision/Control/ShopItem
var in_range = false
var debounce = false

func _process(delta):
	if Input.is_action_pressed("interact") and in_range and not debounce:
		var thread := Thread.new()
		thread.start(_debounce_interact)
		if item.buy_item_pressed(): # successfully bought item
			self.set_script(null) # detach script from node

func _debounce_interact():
	debounce = true
	var wait_time:int = 200
	OS.delay_msec(wait_time)
	debounce = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		in_range = true
		item.display_in_range()

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		in_range = false
		item.display_out_of_range()
