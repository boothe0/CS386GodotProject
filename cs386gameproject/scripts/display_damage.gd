extends Control

class_name DamageLabel

var damage_dealt: int
var enemy_global_position: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func display() -> void:
	var damage_label = Label.new()
	damage_label.text = "%d" % damage_dealt
	damage_label.global_position = enemy_global_position + Vector2(0, -20)  # Start position
	damage_label.add_theme_color_override("font_color", Color(1.0, 0.0, 0.0, 1.0))
	damage_label.add_theme_font_size_override("font_size", 12)
	
	get_tree().root.add_child(damage_label)  # Add to scene root

	# Tween the global_position to move upwards
	var tween = create_tween()
	tween.tween_property(damage_label, "global_position", damage_label.global_position + Vector2(0, -30), 1)
	tween.tween_callback(func(): 
		damage_label.queue_free() 
		self.queue_free()
	)
	

func set_data(damage: int, enemy_global_pos: Vector2, scene_root: Node) -> void:
	damage_dealt = damage
	enemy_global_position = enemy_global_pos
	scene_root.add_child(self)  # Add DamageLabel to scene
	display()
