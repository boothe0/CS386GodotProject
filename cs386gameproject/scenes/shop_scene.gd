extends Node2D

@export var interactable_array : Array[Node2D]

@onready var node_2d: Control = $Node2D

func _ready() -> void:
	for item in node_2d.get_children():
		interactable_array.append(item)
