extends Node
@onready var sword = $Sword

func apply(modifier:float):
	sword.scale = Vector2(sword.scale.x * modifier, sword.scale.y * modifier)
