extends TileMapLayer

@onready var tilemap: TileMapLayer = $'.'
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _input(event):
	if Input.is_action_just_pressed("click"):
		var mouse_pos = get_global_mouse_position()
		var local_pos = tilemap.to_local(mouse_pos)
		var tile_mouse_pos = tilemap.local_to_map(local_pos)
		
		var source_id = 1
		var atlas_cord = Vector2i(1, 2)
		
		print("HERE: ", tile_mouse_pos)
		tilemap.set_cell(tile_mouse_pos, source_id, atlas_cord)
