extends Control

class_name DamageLabel

var damage_dealt: int
var enemy_global_position: Vector2


func _ready() -> void:
	# called when the node enters the scene tree for the first time.
	pass

func display() -> void:
	# get position for damage label to appear
	var damage_label = Label.new()
	damage_label.text = "%d" % damage_dealt
	damage_label.global_position = enemy_global_position + Vector2(0, -20)
	
	# set font colors and sizes
	damage_label.add_theme_color_override("font_color", Color(1.0, 0.0, 0.0, 1.0))
	damage_label.add_theme_font_size_override("font_size", 12)
	
	# add into the main scene
	get_tree().root.add_child(damage_label)

	# tween the global_position to move upwards
	var tween = create_tween()
	tween.tween_property(damage_label, "global_position", damage_label.global_position + Vector2(0, -30), 1)
	tween.tween_callback(func(): 
		damage_label.queue_free() 
		self.queue_free()
	)

func set_data(damage: int, enemy_global_pos: Vector2, scene_root: Node) -> void:
	# get data needed for damage display
	damage_dealt = damage
	enemy_global_position = enemy_global_pos
	scene_root.add_child(self)
	display()
