extends TileMapLayer

@onready var tilemap: TileMapLayer = $'.'
var theme = preload("res://assets/UI_Elements/shop_screen_theme.tres")
var wall_potion_used = false
var potion_indication: Label
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	potion_indication = Label.new()
	potion_indication.theme = theme
	potion_indication.text = "Click to place wall"
	potion_indication.visible = false
	add_child(potion_indication)
	Emitter.wall_potion_used.connect(handle_placement)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if wall_potion_used == true:
		potion_indication.global_position = get_global_mouse_position() + Vector2(10, 10)
func handle_placement():
	wall_potion_used = true
	potion_indication.visible = true
	return wall_potion_used
func _input(event):
	if Input.is_action_just_pressed("click") and wall_potion_used == true:
		var mouse_pos = get_global_mouse_position()
		var local_pos = tilemap.to_local(mouse_pos)
		var tile_mouse_pos = tilemap.local_to_map(local_pos)
			
		var source_id = 1
		var atlas_cord = Vector2i(1, 2)
		potion_indication.visible = false
		tilemap.set_cell(tile_mouse_pos, source_id, atlas_cord)
		wall_potion_used = false
