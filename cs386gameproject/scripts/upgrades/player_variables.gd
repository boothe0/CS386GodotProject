extends Node
# Called when the node enters the scene tree for the first time.
@onready var coins: int = 50
@onready var rounds: int = 0

@onready var health_scale: float = 1.0

@onready var sword_damage_modifier: float = 1.0
@onready var sword_scale: float = 1.0

@onready var projectile_scale: float = 1.0

@onready var consumables: Array[Dictionary] = [
	# go over this with enumerate
	# appened to it using the texture and script from the display when buying
	{
	
	},
	{
		
	},
	
	{
		
	},
]

@onready var consumable_scale_x = 3
@onready var consumable_scale_y = 3.4
@onready var consumable_size = Vector2(50, 40)
# consumable 1 slot positions
@onready var consumable_1_pos = Vector2(960,0)
# consumable 2 slot positions
@onready var consumable_2_pos = Vector2(960,150)
# consumable 3 slot positions
@onready var consumable_3_pos = Vector2(960,300)
@onready var number_consumables : int = 0
